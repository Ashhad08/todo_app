import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/models/task_model.dart';
import '../../backend/services/task_services.dart';

class DisplayCompletedTasks extends StatelessWidget {
  final TaskServices _taskServices = TaskServices();

  DisplayCompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Tasks"),
      ),
      body: StreamProvider.value(
        value: _taskServices.fetchCompletedTasks(),
        initialData: [TaskModel()],
        builder: (context, child) {
          List<TaskModel> _tasksList = context.watch<List<TaskModel>>();
          return ListView.builder(
              itemCount: _tasksList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasksList[index].title.toString()),
                  subtitle: Text(_tasksList[index].description.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon:  Icon(Icons.delete,color: Colors.black.withOpacity(0.6),),
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
