import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/main.dart';
import 'package:task_management_app/screens/SignUpScreen.dart';

int signInError = 0;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyLoginScreen();
  }
}

class MyLoginScreen extends State<StatefulWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      icn: Icon(Icons.account_box_rounded),
                      ctrl: emailController),
                  mySizedBox(5),
                  myPasswordTextField(
                      width: 240, hint: "Password", ctrl: passwordController),
                  mySizedBox(10),
                  ElevatedButton(
                      onPressed: mySignIn,
                      child: myBoldText(size: 12, myText: "Log In")),
                  mySizedBox(10),
                  InkWell(
                    child: myBoldText(
                        size: 12, myText: "New user? Click here to Sign Up"),
                    onTap: () {
                      Navigator.pushNamed(context, "/signupscreen");
                    },
                  ),
                  mySizedBox(10),
                  Container(
                    child: InkWell(
                        onTap: () {
                          signInGoogle();
                        },
                        child:
                            Text("New User? Click her to Sign In with google")),
                  ),
                  if (signInError == 1)
                    Container(
                      child: Text("Please enter correct Email",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      alignment: Alignment.bottomCenter,
                    )
                  else if (signInError == 2)
                    Container(
                      child: Text("Password doesn't match",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      alignment: Alignment.bottomCenter,
                    )
                ],
              )),
        ),
      )),
    );
  }

  Future mySignIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      setState(() {
        myUser = emailController.text;
      });
      signInError = 0;
      Navigator.pushNamed(context, "/userinfoscreen");
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Please enter correct Email");
        setState(() {
          signInError = 1;
        });
      } else if (e.code == "wrong-password") {
        print("Password doesn't match!");
        setState(() {
          signInError = 2;
        });
      }
    }
  }

  Future<UserCredential> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
