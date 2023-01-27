import 'package:flutter/material.dart';
import 'package:task_management_app/constants/Routes.dart';
import 'package:task_management_app/screens/HomeScreen.dart';
import 'package:task_management_app/screens/LogInScreen.dart';
import 'package:task_management_app/screens/onBoarding/onBoardingScreen1.dart';
import 'package:task_management_app/screens/onBoarding/onBoardingScreen2.dart';
import 'package:task_management_app/screens/onBoarding/onBoardingScreen3.dart';
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
        Routes.onBoardingScreen1: (context) => OnBoardingScreen1(),
        Routes.onBoardingScreen2: (context) => OnBoardingScreen2(),
        Routes.onBoardingScreen3: (context) => OnBoardingScreen3(),
        Routes.loginScreen: (context) => LoginScreen(),
        Routes.homescreen: (context) => HomeScreen(),
      },
    );
  }
}
