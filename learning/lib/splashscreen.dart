import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning/login_screen.dart';
import 'package:learning/sing_up_screen.dart';
import 'const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Loginscreen()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("asstes/20943790.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
