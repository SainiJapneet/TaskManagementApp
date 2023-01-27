import 'package:flutter/material.dart';
import 'package:task_management_app/constants/Routes.dart';
import 'package:task_management_app/screens/onBoarding/onBoardingScreen1.dart';
import 'package:task_management_app/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        Routes.onBoardingScreen1: (context) => OnBoradingScreen1(),
      },
    );
  }
}
