import 'package:flutter/material.dart';

class TaskGeneralProfile extends StatelessWidget {
  final String iconImagePath;
  final Color iconColor;
  final Color iconBackgroundColor;
  final int numberOfTasks;
  final String caption;

  TaskGeneralProfile(
      {required this.iconImagePath,
      required this.iconColor,
      required this.iconBackgroundColor,
      required this.numberOfTasks,
      required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: iconBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              iconImagePath,
              color: iconColor,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$numberOfTasks",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(caption,
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey.withOpacity(0.7),
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
