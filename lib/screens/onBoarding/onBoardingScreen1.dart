import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

class OnBoardingScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyOnBoardingScreen1();
  }
}

class MyOnBoardingScreen1 extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
            color: Colors.teal,
            child: InkWell(
              child: myBoldText(size: 20, myText: "OnBoarding Screen1"),
              onTap: () {
                Navigator.popAndPushNamed(context, "/onboarding2");
              },
            )),
      )),
    ));
  }
}
