import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {

  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
  }

  void changeLanguage (String lang){
    languageCode=lang;
    notifyListeners();
  }
}
