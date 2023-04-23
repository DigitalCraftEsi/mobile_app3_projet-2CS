import 'package:flutter/material.dart';
import 'package:mob3/UI/Screens/FailuresScreen.dart';
import 'package:mob3/UI/Screens/MyTasksSkreen.dart';
import 'package:mob3/UI/Screens/NotificationCenterScreen.dart';
import 'package:mob3/UI/Screens/TaskDetailsScreen.dart';
import 'package:mob3/UI/Screens/Welcome.dart';

import 'UI/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mpb 3',
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

