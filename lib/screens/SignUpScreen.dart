import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

int signUpError = 0;

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySignUpScreen();
  }
}

class MySignUpScreen extends State<StatefulWidget> {
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpPasswordController2 = TextEditingController();
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
                  icn: Icon(Icons.account_box),
                  ctrl: signUpEmailController),
              mySizedBox(5),
              myPasswordTextField(
                  width: 240, hint: "Password", ctrl: signUpPasswordController),
              mySizedBox(5),
              myPasswordTextField(
                  width: 240,
                  hint: "Re-Enter your Password",
                  ctrl: signUpPasswordController2),
              mySizedBox(5),
              ElevatedButton(onPressed: mySignUp, child: Text("SignUp")),
              if (signUpError == 1)
                Container(
                  child: Text("Too weak to be password..."),
                  alignment: Alignment.bottomCenter,
                )
              else if (signUpError == 2)
                Container(
                  child: Text("Account already exists!"),
                  alignment: Alignment.bottomCenter,
                )
            ],
          )),
        ),
      )),
    );
  }

  Future mySignUp() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUpEmailController.text,
              password: signUpPasswordController.text);
      final myCollection =
          FirebaseFirestore.instance.collection(signUpEmailController.text);
      signUpError = 0;
      Navigator.pushNamed(context, "/signupscreen");
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("Weak password");
        signUpError = 1;
      } else if (e.code == "email-already-in-use") {
        print("Account already exists");
        signUpError = 2;
      }
    } catch (e) {
      print(e);
    }
  }
}
