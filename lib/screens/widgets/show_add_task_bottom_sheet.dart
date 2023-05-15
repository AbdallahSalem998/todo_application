import 'package:flutter/material.dart';

class ShowAddTaskBottomSheet extends StatefulWidget {
  @override
  State<ShowAddTaskBottomSheet> createState() => _ShowAddTaskBottomSheetState();
}

class _ShowAddTaskBottomSheetState extends State<ShowAddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add new Task",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Task Title";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Task title"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Task Description";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Task Description"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Select Time",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  chooseTaskDate(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "12/12/2022",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("Route C8");
                  }
                },
                child: Text(
                  "Add Task",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void chooseTaskDate(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
