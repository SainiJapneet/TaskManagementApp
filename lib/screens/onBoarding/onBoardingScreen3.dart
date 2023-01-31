import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

class OnBoardingScreen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyOnBoardingScreen3();
  }
}

class MyOnBoardingScreen3 extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: Center(
            child: Container(
                color: Colors.teal,
                child: InkWell(
                  child: myBoldText(size: 20, myText: "OnBoarding Screen3"),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/loginscreen");
                  },
                )),
          )),
        ));
  }
}
