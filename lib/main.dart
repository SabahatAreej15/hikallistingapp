// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:realestate/screens/home.dart';
import 'package:realestate/login.dart';
import 'package:realestate/screens/register.dart';
import 'package:realestate/splash.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Splash(),
    );
  }
}
