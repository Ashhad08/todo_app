// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson(data.docId.toString()));

class TaskModel {
  TaskModel({
    this.docId,
    this.title,
    this.description,
    this.createdDate,
    this.isCompleted,
  });

  String? docId;
  String? title;
  String? description;
  Timestamp? createdDate;
  bool? isCompleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    docId: json["docID"],
    title: json["title"],
    description: json["description"],
    createdDate: json["createdDate"],
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toJson(String Id) => {
    "docID": Id,
    "title": title,
    "description": description,
    "createdDate": Timestamp.fromDate(DateTime.now()),
    "isCompleted": false,
  };
}
