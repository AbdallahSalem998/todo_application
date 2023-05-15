import 'package:flutter/material.dart';
import 'package:todo_application/firebase/firebase_functions.dart';

import '../models/task_model.dart';

class UpdateTask extends StatelessWidget {
  static const String routeName = "editScreen";
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    titleController.text = task.title;
    descriptionController.text = task.description;
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Edit"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(label: Text("task title")),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(label: Text("task description")),
          ),
          ElevatedButton(
              onPressed: () {
                task.title = titleController.text;
                task.description = descriptionController.text;
                FirebaseFunctions.updateTask(task.id, task);
                Navigator.pop(context);
              },
              child: Text("Edit"))
        ],
      ),
    );
  }
}
