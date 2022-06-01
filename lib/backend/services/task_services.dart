import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/backend/models/task_model.dart';

class TaskServices {
  // Create Task
  Future createTask(TaskModel taskModel) async {
    DocumentReference _ref =
        FirebaseFirestore.instance.collection("Task Collection").doc();
    return await _ref.set(taskModel.toJson(_ref.id));
  }

  // Update Task
  Future updateTask(TaskModel taskModel) async {
    return await FirebaseFirestore.instance
        .collection("Task Collection")
        .doc(taskModel.docId)
        .update({
      "title": taskModel.title,
      "description": taskModel.description,
    });
  }

  //Mark Task As Completed
  Future markTaskAsCompleted(String taskID) async {
    return await FirebaseFirestore.instance
        .collection("Task Collection")
        .doc(taskID)
        .update({
      "isCompleted": true,
    });
  }

  // Delete Task
  Future deleteTask(String taskID) async {
    return await FirebaseFirestore.instance
        .collection("Task Collection")
        .doc(taskID)
        .delete();
  }

  // Display All Tasks
  Stream<List<TaskModel>> fetchAllTasks() {
    return FirebaseFirestore.instance
        .collection("Task Collection")
        .snapshots()
        .map((docsList) => docsList.docs
            .map((singleDoc) => TaskModel.fromJson(singleDoc.data()))
            .toList());
  }

  // Display Completed Tasks
  Stream<List<TaskModel>> fetchCompletedTasks() {
    return FirebaseFirestore.instance
        .collection("Task Collection")
        .where("isCompleted", isEqualTo: true)
        .snapshots()
        .map((docsList) => docsList.docs
            .map((singleDoc) => TaskModel.fromJson(singleDoc.data()))
            .toList());
  }

  // Incomplete Task
  Stream<List<TaskModel>> fetchInCompletedTasks() {
    return FirebaseFirestore.instance
        .collection("Task Collection")
        .where("isCompleted", isEqualTo: false)
        .snapshots()
        .map((docsList) => docsList.docs
            .map((singleDoc) => TaskModel.fromJson(singleDoc.data()))
            .toList());
  }

  // Display Specific Task Details
  Stream<TaskModel> fetchSpecificTaskDetails(String taskID) {
    return FirebaseFirestore.instance
        .collection("Task Collection")
        .doc(taskID)
        .snapshots()
        .map((singleTask) => TaskModel.fromJson(singleTask.data()!));
  }
}
