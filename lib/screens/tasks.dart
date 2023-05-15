import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/firebase/firebase_functions.dart';
import 'package:todo_application/models/task_model.dart';
import 'package:todo_application/screens/widgets/task_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Theme.of(context).primaryColor,
          selectedTextColor: Colors.white,
          height: 100,
          dateTextStyle: TextStyle(fontSize: 10),
          dayTextStyle: TextStyle(fontSize: 10),
          monthTextStyle: TextStyle(fontSize: 10),
          onDateChange: (newDate) {
            // New date selected
            setState(() {
              date = newDate;
            });
          },
        ),
        SizedBox(
          height: 18,
        ),
        StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseFunctions.getTasksFromFirestore(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text("Something went wrong"),
                  ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                ],
              );
            }
            var tasksList =
                snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
            if (tasksList.isEmpty) {
              return Center(child: Text("No Tasks"));
            }
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskWidget(tasksList[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: tasksList.length),
            );
          },
        )
        // Expanded(
        //   child: ListView.separated(
        //     separatorBuilder: (context, index) => SizedBox(
        //       height: 10,
        //     ),
        //     itemBuilder: (context, index) {
        //       return TaskWidget();
        //     },
        //     itemCount: 5,
        //   ),
        // )
      ],
    );
  }
}
