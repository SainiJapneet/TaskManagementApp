import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

class OnBoardingScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyOnBoardingScreen2();
  }
}

class MyOnBoardingScreen2 extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
            color: Colors.teal,
            child: InkWell(
              child: myBoldText(size: 20, myText: "OnBoarding Screen2"),
              onTap: () {
                Navigator.popAndPushNamed(context, "/onboarding3");
              },
            )),
      )),
    ));
  }
}
