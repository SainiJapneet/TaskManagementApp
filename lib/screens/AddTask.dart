import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/Model/TaskDataModel.dart';
import 'package:task_management_app/main.dart';
import 'package:task_management_app/screens/SaveAndDiscard.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAddTaskScreen();
  }
}

class MyAddTaskScreen extends State<StatefulWidget> {
  final taskTitleController = TextEditingController();
  final taskDetailsController = TextEditingController();
  final taskDateController = TextEditingController();
  final taskTimeController = TextEditingController();

  String? selectedPriority;
  String? selectedType;
  List<String> priorityOptions = ['Urgent', 'Moderate', 'Cool'];
  List<String> typeOptions = ['Work', 'Personal', 'Miscellaneous'];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Task"),
        ),
        body: SafeArea(
            child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //For close icon
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                    ),
                    color: Colors.yellow,
                    onPressed: () => {Navigator.pop(context)},
                  ),

                  //For check icon
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.yellow,
                    onPressed: () => {btnAddTask()},
                  ),
                ],
              ),
              mySizedBox(10),
              myTextField(
                  width: 340, hint: "Task Title", ctrl: taskTitleController),
              mySizedBox(10),
              IntrinsicHeight(
                child: TextField(
                  controller: taskDetailsController,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Add Task here...",
                      border: OutlineInputBorder()),
                ),
              ),
              mySizedBox(10),
              Flexible(
                child: TextField(
                  controller: taskDateController,
                  onTap: () {
                    selectDate(context, taskDateController);
                  },
                  decoration: InputDecoration(hintText: "Select Deadline Date"),
                ),
              ),
              mySizedBox(10),
              Flexible(
                child: TextField(
                  controller: taskTimeController,
                  onTap: () {
                    selectTime(context, taskTimeController);
                  },
                  decoration: InputDecoration(hintText: 'Select a time'),
                ),
              ),
              mySizedBox(10),
              DropdownButton<String>(
                value: selectedType,
                hint: Text('Select task type'), // optional hint text
                onChanged: (newValue) {
                  setState(() {
                    selectedType = newValue;
                  });
                },
                items: typeOptions.map<DropdownMenuItem<String>>((String type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),
              mySizedBox(10),
              DropdownButton<String>(
                value: selectedPriority,
                hint: Text('Select priority'), // optional hint text
                onChanged: (newValue) {
                  setState(() {
                    selectedPriority = newValue;
                  });
                },
                items: priorityOptions.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));

    if (picked != null) {
      controller.text = picked.toString().substring(0, 10);
    }
  }

  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      controller.text = picked.format(context);
    }
  }

  Future btnAddTask() async {
    final task = TaskDataModel(
        title: taskTitleController.text,
        detail: taskDetailsController.text,
        date: taskDateController.text,
        time: taskTimeController.text,
        priority: selectedPriority,
        type: selectedType);

    final docTask = FirebaseFirestore.instance
        .collection(myUser)
        .doc("${taskTitleController.text}_${DateTime.now()}");
    await docTask.set(task.toJson());
    taskTitleController.clear();
    taskDetailsController.clear();
    taskDateController.clear();
    taskTimeController.clear();

    Navigator.pushNamed(context, "/homescreen");
  }
}
