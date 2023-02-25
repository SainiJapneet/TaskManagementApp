import 'package:flutter/material.dart';

import '../Model/TaskDataModel.dart';

class DailyListView extends StatelessWidget {
  const DailyListView(this.dailyListView, {super.key});
  final List<TaskDataModel> dailyListView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: dailyListView.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 7,
                    child: ListTile(
                      title: Text(
                        dailyListView[index].taskTitle,
                        style: const TextStyle(fontSize: 20),
                      ),
                      //subtitle: Text(dailyListView[index].subTasks.toString()),
                    ),
                  );
                })),
      ],
    );
  }
}
