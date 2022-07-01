import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/Screen/Home_UI.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Used for Responsive Design
      designSize: Size(360, 712), // size initialized
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: widget,
        );
      },
      child: QuizPage(), // Home Screen UI
    );
  }
}
