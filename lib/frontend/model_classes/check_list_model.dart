import 'package:flutter/material.dart';

class CheckListModel {
  final String iconImagePath;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String category;
  final String numberOfTasks;

  CheckListModel(
      {required this.iconImagePath,
      required this.iconColor,
      required this.iconBackgroundColor,
      required this.category,
      required this.numberOfTasks});
}
