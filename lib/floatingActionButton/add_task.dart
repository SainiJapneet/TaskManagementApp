import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var _addTaskController;

  @override
  void initState() {
    super.initState();
    _addTaskController = TextEditingController();
  }

  @override
  void dispose() {
    _addTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 4.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
              elevation: 7.0,
              color: Colors.yellow,
              shadowColor: Colors.deepOrange,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: TextField(
                  controller: _addTaskController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Tasks',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
