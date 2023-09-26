import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realestate/login.dart';
import 'package:realestate/theme/theme.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  splash() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? CustomAppTheme().colorBlack : CustomAppTheme().cardWhite,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  dark ? "assets/gif/white.gif" : "assets/gif/black.gif",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
