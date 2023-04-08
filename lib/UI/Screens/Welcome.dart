import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app3/UI/Screens/MyInfoScreen.dart';
import 'package:mobile_app3/UI/Screens/SettingsScreen.dart';
import 'dart:async';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 113, 75, 1),
      body: Center(
        child: Image.asset(
          "lib/UI/assets/Images/welcome.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
