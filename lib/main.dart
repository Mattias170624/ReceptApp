// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:grupp_project/utilities/themes/mainTheme.dart';
import 'package:grupp_project/screens/dynamic_main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'services/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
