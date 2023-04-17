import 'package:flutter/material.dart';
import 'package:learning/textfiled.dart';
import 'const.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgcolor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.87,
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 0),
                  spreadRadius: 2,
                )
              ]),
          child: Column(
            children: [
              Text(
                'Sign-up',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colors.bgcolor),
              ),
              SizedBox(
                height: 10,
              ),
              getEmailTextFiled(),
              getNumberTextFiled(),
              getPasswordTextFiled(),
              appSignupButton(context),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(fontSize: 15, color: colors.bgcolor)),
                  SizedBox(
                    width: 2,
                  ),
                  Text('Login',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: colors.bgcolor))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
