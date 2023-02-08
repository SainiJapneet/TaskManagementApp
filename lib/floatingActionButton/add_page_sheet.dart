import 'package:task_management_app/floatingActionButton/add_task.dart';
import 'package:task_management_app/floatingActionButton/date_and_time.dart';
import 'package:task_management_app/floatingActionButton/save_and_discard.dart';
import 'package:task_management_app/floatingActionButton/task_title.dart';
import 'package:task_management_app/floatingActionButton/type_and_priority.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/floatingActionButton/save_and_discard.dart';
import 'package:task_management_app/floatingActionButton/task_title.dart';

class AddPageSheet extends StatelessWidget {
  const AddPageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purple,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: const [
            SaveAndDiscard(),
            TaskTitle(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Divider(
                color: Colors.yellow,
                thickness: 0.9,
              ),
            ),
            AddTask(),
            TypeAndPriority(),
            DateAndTime()
          ]),
        ),
      ),
    );
  }
}
