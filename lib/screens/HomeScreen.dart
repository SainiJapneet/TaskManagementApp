import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeScreen();
  }
}

class MyHomeScreen extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Center(
        //child: ListView.separated(itemBuilder: myList.lenght, separatorBuilder: separatorBuilder, itemCount: itemCount),
      ))),
    );
  }
}
