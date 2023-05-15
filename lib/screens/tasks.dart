import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
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
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              return TaskWidget();
            },
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
