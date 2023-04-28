import 'package:flutter/material.dart';
import 'package:learning/splashscreen.dart';
import 'package:learning/test_fast_api.dart';
import 'package:learning/web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebLogin(),
    );
  }
}
