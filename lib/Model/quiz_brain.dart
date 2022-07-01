import 'package:quiz_app/Model/question.dart';

class Quizbrain { // used for quiz bank class to generate a quiz
  int _qn = 0; // question number initialize  to 0

  List<Question> _quesbank = [ // qestions with answer holder list
    Question('Apple seeds contain arsenic', false),
    Question('Papillon is the French word for Butterfly.', true),
    Question('Singer Pink’s real name is Alecia Beth Moore', true),
    Question(
        ' The first country in the world to use postcards was the United States of America.',
        false),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question(
        'The Statue of Liberty was a gift of France for the United States of America in 1886.',
        false),
    Question(
        'Freddie Mercury is the lead guitarist of the rock band \“Queen\”.',
        false),
    Question(
        'In school, Albert Einstein failed most of the subjects, except for physics and math.',
        true),
    Question(' Coffee beans can cause Typhoid', false),
    Question('AB- is the rarest type of blood in humans.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'It takes around 8 minutes and 20 seconds for light to travel from the Sun to Earth.',
        true),
    Question(
        ' Mount Everest, the highest mountain above the sea level in the world, is located in the Himalayas.',
        true),
  ];

  void nextQuestion() { // check to next question
    if (_qn < _quesbank.length - 1) {
      _qn = _qn + 1;
    }
  }

  String getquestion() { // get a question
    return _quesbank[_qn].question;
  }

  bool getanswer() { // get a answer
    return _quesbank[_qn].answer;
  }

  bool isFinished() { // check if finished
    if (_qn >= _quesbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() { // return back to first question
    _qn = 0;
  }
}
