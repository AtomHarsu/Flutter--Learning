import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learning/mybog(homescreen).dart';

class LoginandVerify extends StatefulWidget {
  const LoginandVerify({super.key});

  @override
  State<LoginandVerify> createState() => _LoginandVerifyState();
}

class _LoginandVerifyState extends State<LoginandVerify> {
  TextEditingController mobilCOntroller = TextEditingController();

  Future<void> sentOTP() async {
    try {
      var response = await post(
        Uri.parse('https://alkanir.com/app/v1/api/send_otp'),
        body: {'mobile': mobilCOntroller.text},
      );
      var data = json.decode(response.body.toString());
      if (response.statusCode == 200 && data['error'] == false) {
        print('data   $data');
      }
    } catch (e) {
      print('e :::${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login'),
          TextFormField(
            controller: mobilCOntroller,
          ),
          ElevatedButton(
            onPressed: () {
              sentOTP();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VerifyOTP(mobilenumber: mobilCOntroller.text),
                  ));
            },
            child: Text('child'),
          )
        ],
      ),
    );
  }
}

class VerifyOTP extends StatefulWidget {
  String? mobilenumber;
  VerifyOTP({super.key, required this.mobilenumber});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOTP() async {
    try {
      var response = await post(
        Uri.parse('https://alkanir.com/app/v1/api/verify_otp'),
        body: {
          'mobile': widget.mobilenumber,
          'otp': otpController.text,
        },
      );
      var data = json.decode(response.body.toString());
      if (response.statusCode == 200 && data['error'] == false) {
        print('data   $data');
      }
    } catch (e) {
      print('e :::${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Verify'),
          TextFormField(
            controller: otpController,
          ),
          ElevatedButton(
            onPressed: () {
              verifyOTP();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomeScreenDart(),
                  ));
            },
            child: Text('child'),
          )
        ],
      ),
    );
  }
}

class MyHomeScreenDart extends StatefulWidget {
  const MyHomeScreenDart({super.key});

  @override
  State<MyHomeScreenDart> createState() => _MyHomeScreenDartState();
}

class _MyHomeScreenDartState extends State<MyHomeScreenDart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
