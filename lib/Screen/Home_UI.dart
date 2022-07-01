import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/Model/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizBrain = Quizbrain(); // creates a object

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) { // to get check answer
    bool correctAnswer = quizBrain.getanswer();

    // if finished or not
    setState(() {
      if (quizBrain.isFinished() == true) {
        // alert dialog
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Center(
                    child: Text(
                      quizBrain.getquestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                      checkAnswer(true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
              Row(
                children: scoreKeeper, // icon holder
              )
            ],
          ),
        ),
      ),
    );
  }
}
