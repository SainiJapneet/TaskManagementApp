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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myBoldText(size: 40, myText: "Sign Up Screen"),
              myTextField(
                  width: 240,
                  hint: "Create a userId",
                  icn: Icon(Icons.account_box)),
              mySizedBox(5),
              myPasswordTextField(width: 240, hint: "Password"),
              mySizedBox(5),
              myPasswordTextField(width: 240, hint: "Re-Enter your Password"),
              mySizedBox(5),
              ElevatedButton(
                  onPressed: () =>
                      {Navigator.popAndPushNamed(context, "/loginscreen")},
                  child: Text("Create Account"))
            ],
          )),
        ),
      )),
    );
  }
}
