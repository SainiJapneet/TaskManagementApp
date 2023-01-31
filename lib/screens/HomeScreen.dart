import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

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
        child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              return myListContainer(
                  title: myList[index][0],
                  date: myList[index][1],
                  time: myList[index][2],
                  priority: myList[index][3],
                  status: myList[index][4]);
            }),
      ))),
    );
  }

  List<List<String>> myList = [
    ["Title1", "dd/mm/yyyy", "00:00", "Very Urgent", "Pending"],
    ["Title2", "dd/mm/yyyy", "04:00", "Urgent", "Pending"],
    ["Title3", "dd/mm/yyyy", "06:00", "Medium", "Done"],
    ["Title4", "dd/mm/yyyy", "08:00", "Not important", "Pending"],
    ["Title5", "dd/mm/yyyy", "10:00", "Urgent", "Done"]
  ];
}
