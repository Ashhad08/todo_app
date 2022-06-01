import 'package:flutter/material.dart';
import 'package:todo_app/backend/models/task_model.dart';
import 'package:todo_app/backend/services/task_services.dart';

class UpdateTask extends StatefulWidget {
  final TaskModel _model;

  const UpdateTask(this._model, {Key? key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _titleController =
        TextEditingController(text: widget._model.title.toString());
    _descriptionController =
        TextEditingController(text: widget._model.description.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Task"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _titleController,
          ),
          TextFormField(controller: _descriptionController),
          RaisedButton(
              child: const Text("Update"),
              onPressed: () {
                TaskServices()
                    .updateTask(TaskModel(
                  docId: widget._model.docId.toString(),
                  title: _titleController.text,
                  description: _descriptionController.text,
                ))
                    .then((value) {
                  Navigator.pop(context);
                });
              })
        ],
      ),
    );
  }
}
