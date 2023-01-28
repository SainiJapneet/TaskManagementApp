import 'package:flutter/material.dart';
import 'package:task_management_app/constants/Routes.dart';
import 'package:task_management_app/screens/HomeScreen.dart';
import 'package:task_management_app/screens/LogInScreen.dart';
import 'package:task_management_app/screens/SignUpScreen.dart';
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
        Routes.homeScreen: (context) => HomeScreen(),
        Routes.loginScreen: (context) => LoginScreen(),
        Routes.onBoardingScreen1: (context) => OnBoardingScreen1(),
        Routes.onBoardingScreen2: (context) => OnBoardingScreen2(),
        Routes.onBoardingScreen3: (context) => OnBoardingScreen3(),
        Routes.signUpScreen: (context) => SignUpScreen(),
      },
    );
  }
}

Widget mySizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget myBoldText({required double size, required String myText}) {
  return Text(myText,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold));
}

Widget myTextField(
    {required double width,
    required String hint,
    required Icon icn,
    bool obscure = false}) {
  return SizedBox(
    width: width,
    child: TextField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(hintText: hint, icon: icn),
      obscureText: obscure,
    ),
  );
}
