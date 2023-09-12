import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class FlutterWEbView extends StatefulWidget {
  @override
  State<FlutterWEbView> createState() => FlutterWEbViewState();
}

class FlutterWEbViewState extends State<FlutterWEbView> {
  WebViewController? controller;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("TutorialKart - Flutter WebView"),
          ),
          body: Center(
            child: WebViewPlus(
              initialUrl: 'https://www.google.com/',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )),
    );
  }
}
