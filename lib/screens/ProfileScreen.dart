import 'package:flutter/material.dart';
import '../Model/TaskDataModel.dart';
import '../widgets/dailyListView.dart';
import '../widgets/recentView.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<TaskDataModel> _taskList = [];
  List<TaskDataModel> get _recentTasks {
    return _taskList.where((task) {
      return DateTime.parse(task.taskDate)
          .isBefore(DateTime.now().add(Duration(days: 7)));
    }).toList();
  }

  List<TaskDataModel> get _after7Days {
    return _taskList.where((task) {
      return DateTime.parse(task.taskDate)
          .isAfter(DateTime.now().add(Duration(days: 7)));
    }).toList();
  }

  List<TaskDataModel> get _dailyListView {
    return _taskList.where((task) {
      return DateTime.parse(task.taskDate)
          .isBefore(DateTime.now().add(Duration(days: 1)));
    }).toList();
  }

  bool _showTasksList = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Theme.of(context).primaryColor,
      //     Theme.of(context).scaffoldBackgroundColor
      //   ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
              width: double.infinity,
              height: 70,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'Hi ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextSpan(
                            text: 'Prajwal,   \n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        TextSpan(
                            text: 'Welcome back',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ]),
                ),
              )),
          SizedBox(
            height: 52,
            width: 115,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 30,
            width: 100,
            child: Center(
              child: Text(
                _showTasksList ? 'Daily' : 'Recently',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Switch(
              activeColor: Theme.of(context).colorScheme.onSecondary,
              value: _showTasksList,
              onChanged: (val) {
                setState(() {
                  _showTasksList = val;
                });
              }),
          SizedBox(
              height: 550,
              child: _showTasksList
                  ? DailyListView(_dailyListView)
                  : RecentView(_recentTasks, _after7Days))
        ],
      ),
    );
  }
}
