import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends State<StatefulWidget> {
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/onboarding1'),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: Center(
              child: Container(
        width: MediaQuery.of(context).size.width * .90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myBoldText(size: 40, myText: "Task Manager"),
            mySizedBox(10),
            Image.asset("assets/Icon.jpg"),
            mySizedBox(5),
            myBoldText(size: 10, myText: "Managing tasks, made easier")
          ],
        ),
      ))),
    ));
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
}