// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.orange,
      onPrimary: Colors.deepOrangeAccent,
      secondary: Colors.green.shade600,
      onSecondary: Colors.black,
      error: Colors.black,
      onError: Colors.black,
      background: Color(0xf2f2f7ff),
      onBackground: Colors.black,
      surface: Colors.black,
      onSurface: Colors.black,
    ),
  );
}
