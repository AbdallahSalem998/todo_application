import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/home_layout/home_layout.dart';
import 'package:todo_application/providers/my_provider.dart';
import 'package:todo_application/screens/update_task.dart';
import 'package:todo_application/shared/styles/my_theme.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();

  runApp(
      ChangeNotifierProvider<MyProvider>(
          create: (context) => MyProvider(),
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      themeMode: provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        UpdateTask.routeName: (context) => UpdateTask(),
      },
    );
  }
}
