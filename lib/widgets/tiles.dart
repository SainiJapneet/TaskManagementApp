import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/TaskDataModel.dart';

class Tiles extends StatelessWidget {
  const Tiles(
    this.recentTaskData, {
    super.key,
  });
  final List<TaskDataModel> recentTaskData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: recentTaskData
            .map((tasks) => Container(
                  padding: EdgeInsets.all(4),
                  width: 220,
                  margin:
                      EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          //task editing page
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: AutoSizeText(
                                tasks.taskTitle,
                                // style: TextStyle(fontSize: 30),
                                minFontSize: 16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                  'Complete by: ${DateFormat.yMMMEd().format(DateTime.parse(tasks.taskDate))} \n${DateFormat.jm().format(DateTime.parse(tasks.taskDate))}'),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            SizedBox(
                                height: 20,
                                width: 180,
                                child: Text(
                                  'Progress',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                )),
                            SizedBox(
                              height: 5,
                              width: 180,
                              child: Stack(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Container(
                                    // height: 5,
                                    // width: 180,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 0.5,
                                    child: Container(
                                      // height: 5,
                                      // width: 180,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 232, 192, 255),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
