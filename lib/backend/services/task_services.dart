import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/backend/models/task_model.dart';

class TaskServices {
  // Create Task
  Future createTask(TaskModel taskModel) async {
    return await FirebaseFirestore.instance // initializes the firebase
        .collection("taskCollection") // makes the collection(table)
        .add(taskModel.toJson());
  }

  // Update Task
  Future updateTask(TaskModel taskModel) async {
    return await FirebaseFirestore.instance
        .collection("taskCollection")
        .doc(taskModel.docId)
        .update({
      "title": taskModel.title,
      "description": taskModel.description,
    });
  }

  //Mark Task As Completed
  Future markTaskAsCompleted(String taskID) async {
    return await FirebaseFirestore.instance
        .collection("taskCollection")
        .doc(taskID)
        .update({
      "isCompleted": true,
    });
  }

  // Delete Task
  Future deleteTask(String taskID) async {
    return await FirebaseFirestore.instance
        .collection("taskCollection")
        .doc(taskID)
        .delete();
  }

  // Display All Tasks
  Stream<List<TaskModel>> fetchAllTasks() {
    return FirebaseFirestore.instance
        .collection("taskCollection")
        .snapshots()
        .map((docsList) => docsList.docs
            .map((singleDoc) => TaskModel.fromJson(singleDoc.data()))
            .toList());
  }

  // Display Completed Tasks
  Stream<List<TaskModel>> fetchCompletedTasks() {
    return FirebaseFirestore.instance
        .collection("taskCollection")
        .where("isCompleted", isEqualTo: true)
        .snapshots()
        .map((docsList) => docsList.docs
            .map((singleDoc) => TaskModel.fromJson(singleDoc.data()))
            .toList());
  }

  // Incomplete Task
  Stream<List<TaskModel>> fetchInCompletedTasks() {
    return FirebaseFirestore.instance
        .collection("taskCollection")
        .where("isCompleted", isEqualTo: false)
        .snapshots()
        .map((docsList) => docsList.docs
            .map((singleDoc) => TaskModel.fromJson(singleDoc.data()))
            .toList());
  }

  // Display Specific Task Details
  Stream<TaskModel> fetchSpecificTaskDetails(String taskID) {
    return FirebaseFirestore.instance
        .collection("taskCollection")
        .doc(taskID)
        .snapshots()
        .map((singleTask) => TaskModel.fromJson(singleTask.data()!));
  }
}