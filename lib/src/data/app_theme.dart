import 'package:flutter/material.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  Light,
  // ignore: constant_identifier_names
  Dark,
}

final appThemeData = {

  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
};
