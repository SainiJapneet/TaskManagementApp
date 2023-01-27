import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoradingScreen1 extends StatefulWidget {
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
          child: Text("OnBoarding Screen1"),
        ),
      )),
    ));
  }
}
