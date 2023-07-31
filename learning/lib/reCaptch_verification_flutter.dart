import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String recaptchaSiteKey = '6LcO5WwnAAAAAEFs4Q6AQ9ZArVWdd4DyYG246xp_';
const String backendUrl = '6LcO5WwnAAAAAP8TiHHv8wJ4uIjnnGkn5DtDJ0wE';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  String? verificationToken;

  @override
  void initState() {
    super.initState();
    _getCaptch();
  }

  void _getCaptch() {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.startsWith(backendUrl)) {
        // Extract verification token from the URL
        setState(() {
          verificationToken = Uri.parse(url).queryParameters['token'];
        });
        // Close the WebView after token extraction
        flutterWebviewPlugin.close();
      }
    });
  }

  void _startVerification() {
    flutterWebviewPlugin.launch(
      'https://www.google.com/recaptcha/api.js?render=$recaptchaSiteKey',
      withJavascript: true,
      clearCache: true,
      clearCookies: true,
      hidden: true,
    );
  }

  void _verifyToken(String token) async {
    final response = await http.post(
      Uri.parse('$backendUrl/verify'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'token': token}),
    );

    if (response.statusCode == 200) {
      // Token verification successful, perform required actions here.
      print('Token verification successful!');
    } else {
      // Token verification failed, handle accordingly.
      print('Token verification failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reCAPTCHA Verification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _startVerification();
          },
          child: Text('Start Verification'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (verificationToken != null) {
            _verifyToken(verificationToken!);
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
