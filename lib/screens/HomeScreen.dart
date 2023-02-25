import 'package:firebase_auth/firebase_auth.dart';
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
  int selectedIndex = 0;

  Future onItemSelected(int index) async {
    //Code for bottomNavigationBar
    switch (index) {
      case 0:
        Navigator.popAndPushNamed(context, "/homescreen");
        break;
      case 1:
        Navigator.pushNamed(context, "/addtaskscreen");
        break;
      case 2:
        myUser = "";
        await FirebaseAuth.instance.signOut();
        Navigator.popAndPushNamed(context, "/loginscreen");
        break;
    }
    setState(() {
      selectedIndex = index;
    });
  }

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
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 20), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.post_add, size: 20), label: "New"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  label: "Log Out")
            ],
            currentIndex: selectedIndex,
            onTap: onItemSelected,
          )),
    );
  }

  List<List<String>> myList = [
    ["Cook Food", "25/02/2023", "00:00", "Very Urgent", "Pending"],
    ["Complete Assignment", "25/02/2023", "04:00", "Urgent", "Pending"],
    ["Water Plants", "26/02/2023", "06:00", "Medium", "Done"],
    ["Grocceries", "27/02/2023", "08:00", "Not important", "Pending"],
    ["Party", "27/02/2023", "10:00", "Urgent", "Done"]
  ];
}
