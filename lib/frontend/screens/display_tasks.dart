import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/backend/models/task_model.dart';
import 'package:todo_app/frontend/screens/Update_Task.dart';
import 'package:todo_app/frontend/screens/create_task.dart';

import '../../backend/services/task_services.dart';
import 'display_Incomplete_tasks.dart';
import 'display_completed_tasks.dart';
import 'display_task_details.dart';

class DisplayAllTasks extends StatelessWidget {
  final TaskServices _taskServices = TaskServices();

  DisplayAllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tasks"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayCompletedTasks()));
              },
              icon: const Icon(Icons.checklist)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayInCompleteTasks()));
              },
              icon: const Icon(Icons.mark_chat_unread_outlined)),
        ],
      ),
      body: StreamProvider.value(
        value: _taskServices.fetchAllTasks(),
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
                        splashColor: Colors.blue,
                        icon: const Icon(Icons.done),
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
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        splashColor: Colors.red,
                        icon: const Icon(Icons.delete),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateTaskView()));
        },
      ),
    );
  }
}
