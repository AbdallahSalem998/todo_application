import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          backgroundColor: Colors.red,
          onPressed: (context) {},
          icon: Icons.delete,
          label: "Delete",
        ),
        SlidableAction(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: (context) {},
          icon: Icons.edit,
          label: "Edit",
        ),
      ]),
      child: SizedBox(
        height: 90,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          margin: EdgeInsets.symmetric(horizontal: 18),
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
                    "Task Title",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Task Description",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
