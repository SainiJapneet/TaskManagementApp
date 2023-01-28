import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyLoginSCreen();
  }
}

class MyLoginSCreen extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Center(
          child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myBoldText(size: 40, myText: "LogIn Screen"),
                  mySizedBox(20),
                  myTextField(
                      width: 240,
                      hint: "User ID",
                      icn: Icon(Icons.account_box_rounded)),
                  mySizedBox(5),
                  myTextField(
                      width: 240,
                      hint: "Password",
                      icn: Icon(Icons.key),
                      obscure: true),
                  mySizedBox(10),
                  ElevatedButton(
                      onPressed: () => {},
                      child: myBoldText(size: 12, myText: "Log In")),
                  mySizedBox(10),
                  InkWell(
                    child: myBoldText(
                        size: 12, myText: "New user? Click here to Sign Up"),
                    onTap: () {
                      Navigator.pushNamed(context, "/signupscreen");
                    },
                  )
                ],
              )),
        ),
      )),
    );
  }
}
