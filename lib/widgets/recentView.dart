import 'package:flutter/material.dart';
import 'tiles.dart';
import 'list.dart';

class RecentView extends StatelessWidget {
  const RecentView(this.recentTasks, this.after7Days, {super.key});
  final recentTasks;
  final after7Days;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tiles(recentTasks),
        Lists(after7Days),
      ],
    );
  }
}
