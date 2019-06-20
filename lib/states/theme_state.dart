import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier {
  AppTheme appTheme;

  ThemeState() {
    appTheme =
        AppTheme(brightness: Brightness.dark, primarySwatch: Colors.blue);
  }
  get theme {
    return appTheme;
  }
}

class AppTheme {
  Brightness brightness;
  Color primarySwatch;

  AppTheme({this.brightness, this.primarySwatch});
}
