// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:grupp_project/utilities/themes/mainTheme.dart';
import 'package:grupp_project/screens/dynamic_main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: DynamicMainScreen(),
    );
  }
}
