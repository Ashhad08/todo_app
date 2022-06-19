import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/models/task_model.dart';
import '../../backend/services/task_services.dart';
import 'Update_Task.dart';
import 'display_task_details.dart';

class DisplayInCompleteTasks extends StatelessWidget {
  final TaskServices _taskServices = TaskServices();

  DisplayInCompleteTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InCompleted Tasks"),
      ),
      body: StreamProvider.value(
        value: _taskServices.fetchInCompletedTasks(),
        initialData: [TaskModel()],
        builder: (context, child) {
          List<TaskModel> _tasksList = context.watch<List<TaskModel>>();
          return ListView.builder(
              itemCount: _tasksList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayTaskDetails(
                                _tasksList[index].title.toString(),
                                _tasksList[index].createdDate.toString(),
                                _tasksList[index].description.toString(),
                                _tasksList[index].isCompleted!)));
                  },
                  title: Text(_tasksList[index].title.toString()),
                  subtitle: Text(_tasksList[index].description.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.done,color: Colors.black.withOpacity(0.6)),
                        onPressed: () {
                          _taskServices.markTaskAsCompleted(
                              _tasksList[index].docId.toString());
                          showDialog(
                              context: context,
                              builder: (context) {
                                if (_tasksList[index].isCompleted == true) {
                                  return AlertDialog(
                                    title: const Text("Message!"),
                                    content:
                                        const Text("Task Already completed"),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Okay"))
                                    ],
                                  );
                                } else {
                                  return AlertDialog(
                                    title: const Text("Message!"),
                                    content: const Text("Task Marked complete"),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Okay"))
                                    ],
                                  );
                                }
                              });
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateTask(_tasksList[index])));
                          },
                          icon:  Icon(Icons.edit,color: Colors.black.withOpacity(0.6))),
                      IconButton(
                        icon: Icon(Icons.delete,color: Colors.black.withOpacity(0.6)),
                        onPressed: () {
                          _taskServices
                              .deleteTask(_tasksList[index].docId.toString());
                        },
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
