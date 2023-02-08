import 'package:flutter/material.dart';

class TaskTitle extends StatefulWidget {
  const TaskTitle({super.key});

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  var _taskTitleController;

  @override
  void initState() {
    super.initState();
    _taskTitleController = TextEditingController();
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 8.0),
      child: Card(
        elevation: 10.0,
        color: Colors.yellow,
        shadowColor: Colors.deepOrange,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: TextField(
            controller: _taskTitleController,
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
            ),
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
