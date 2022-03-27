import 'package:flutter/material.dart';

class TasksListTileModel {
  final String iconImagePath;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String subTitle;

  TasksListTileModel(
      {required this.iconImagePath,
      required this.iconColor,
      required this.iconBackgroundColor,
      required this.title,
      required this.subTitle});
}
