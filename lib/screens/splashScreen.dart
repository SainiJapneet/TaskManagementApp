import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_n_spinner/logo_n_spinner.dart';
import 'package:task_management_app/main.dart';

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
      () => Navigator.popAndPushNamed(context, '/onboarding1'),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                LogoandSpinner(
                  imageAssets: 'assets/Icon.jpg',
                  reverse: true,
                  arcColor: Colors.blue,
                  spinSpeed: Duration(seconds: 1),
                ),
                mySizedBox(5),
                myBoldText(size: 15, myText: "Managing tasks, made easier")
              ],
            ),
          ))),
        ));
  }
}
