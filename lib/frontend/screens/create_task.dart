import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:todo_app/backend/models/task_model.dart';
import 'package:todo_app/backend/services/task_services.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final TaskServices _taskServices = TaskServices();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Task"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(label: Text("Task Title")),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration:
                  const InputDecoration(label: Text("Task Description")),
            ),
            const SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () async {
                makeLoadingTrue();
                await _taskServices
                    .createTask(TaskModel(
                  title: _titleController.text,
                  description: _descriptionController.text,
                ))
                    .then((value) {
                  makeLoadingFalse();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Message!"),
                          content: const Text("Task created successfully"),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Okay"))
                          ],
                        );
                      });
                }).onError((error, stackTrace) {
                  makeLoadingFalse();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Alert!"),
                          content: const Text("An undefined error occurred!"),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Try Again"))
                          ],
                        );
                      });
                });
              },
              child: const Text("Create task"),
            )
          ],
        ),
      ),
    );
  }

  makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }
}
