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

Widget myTextField({required double width, required String hint, Icon? icn}) {
  return SizedBox(
    width: width,
    child: TextField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(hintText: hint, icon: icn),
    ),
  );
}

Widget myPasswordTextField({required double width, required String hint}) {
  return SizedBox(
    width: width,
    child: TextField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(hintText: hint, icon: Icon(Icons.lock)),
      obscureText: true,
    ),
  );
}

Widget myListContainer(
    {String? title,
    String? date,
    String? time,
    String? priority,
    String? status}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: double.infinity * .80,
    height: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 183, 204, 149)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        mySizedBox(3),
        Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 230, 217, 178)),
          child: Padding(
              padding: EdgeInsets.all(4),
              child: myBoldText(size: 24, myText: "$title")),
        ),
        mySizedBox(3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 230, 217, 178)),
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: myBoldText(size: 16, myText: "Date: $date")),
            ),
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 230, 217, 178)),
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: myBoldText(size: 16, myText: "Priority: $priority")),
            ),
          ],
        ),
        mySizedBox(3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 230, 217, 178)),
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: myBoldText(size: 16, myText: "Time: $time")),
            ),
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 230, 217, 178)),
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: myBoldText(size: 16, myText: "Status: $status")),
            ),
          ],
        ),
      ],
    ),
  );
}
