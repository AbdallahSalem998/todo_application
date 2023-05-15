import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_application/firebase/firebase_functions.dart';
import 'package:todo_application/models/task_model.dart';
import 'package:todo_application/screens/update_task.dart';
import 'package:todo_application/shared/styles/app_colors.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;

  TaskWidget(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          backgroundColor: Colors.red,
          onPressed: (context) {
            FirebaseFunctions.deleteTask(taskModel.id);
          },
          icon: Icons.delete,
          label: "Delete",
        ),
        SlidableAction(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: (context) {
            Navigator.pushNamed(context, UpdateTask.routeName,
                arguments: taskModel);
          },
          icon: Icons.edit,
          label: "Edit",
        ),
      ]),
      child: SizedBox(
        height: 90,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                child: VerticalDivider(
                  width: 30,
                  thickness: 3,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: taskModel.status
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: greenColor)
                        : Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    taskModel.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              taskModel.status
                  ? Text(
                      "DONE!",
                      style: TextStyle(color: greenColor),
                    )
                  : InkWell(
                      onTap: () {
                        taskModel.status = true;
                        FirebaseFunctions.updateTask(taskModel.id, taskModel);
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).primaryColor),
                          child: Icon(
                            Icons.done,
                            size: 30,
                            color: Colors.white,
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
