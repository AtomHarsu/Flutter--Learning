import 'package:flutter/material.dart';
import 'package:learning/sing_up_screen.dart';
import 'package:learning/textfiled.dart';
import 'const.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgcolor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.87,
          height: MediaQuery.of(context).size.height * 0.45,
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
                'Login',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colors.bgcolor),
              ),
              SizedBox(
                height: 10,
              ),
              getEmailTextFiled(),
              getPasswordTextFiled(),
              appLoginButton(context),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don\'t have an account?",
                      style: TextStyle(fontSize: 15, color: colors.bgcolor)),
                  SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: () {
                      print("executed");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Signupscreen()));
                    },
                    child: Text('Sign-Up',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colors.bgcolor)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
