import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/main.dart';

class UserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyUserInfo();
  }
}

class MyUserInfo extends State<StatefulWidget> {
  String? selectedGender;
  List<String> genderOptions = ['Male', 'Female', 'Others'];
  final userNameController = TextEditingController();
  final userAgeController = TextEditingController();
  final userPhoneController = TextEditingController();
  final userAddressController = TextEditingController();
  var dateController = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            mySizedBox(80),
            myTextField(width: 340, hint: "Name", ctrl: userNameController),
            mySizedBox(10),
            SizedBox(
              width: 340,
              child: TextField(
                controller: dateController,
                onTap: () {
                  _selectDate(
                      context); // call _selectDate() function when TextField is tapped
                },
                decoration: InputDecoration(
                  hintText: 'Date Of Birth',
                ),
              ),
            ),
            mySizedBox(10),
            SizedBox(
              width: 340,
              child: DropdownButton<String>(
                value: selectedGender,
                hint: Text('Select Gender'), // optional hint text
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
                items: genderOptions.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
            ),
            mySizedBox(10),
            myTextField(
                width: 340, hint: "Phone Number", ctrl: userPhoneController),
            mySizedBox(10),
            myTextField(
                width: 340, hint: "Address", ctrl: userAddressController),
            ElevatedButton(
                onPressed: btnSubmit,
                child: myBoldText(size: 20, myText: "Submit"))
          ],
        ),
      )),
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked
            .toString()
            .substring(0, 10); // set the picked date to the TextField
      });
    }
  }

  void btnSubmit() {
    userName = userNameController.text;
    userDOB = userAgeController.text;
    userGender = selectedGender;
    userPhone = userPhoneController.text;
    userAddress = userAddressController.text;

    Navigator.pushNamed(context, "/homescreen");
  }
}
