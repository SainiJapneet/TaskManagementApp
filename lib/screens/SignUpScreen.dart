import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySignUpScreen();
  }
}

class MySignUpScreen extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Center(
          child:
              Container(child: myBoldText(size: 40, myText: "SignUp Screen")),
        ),
      )),
    );
  }
}
