import 'package:flutter/material.dart';
import 'package:learning/login_screen.dart';
import 'package:learning/mybog(homescreen).dart';
import 'package:learning/sing_up_screen.dart';
import 'const.dart';

getEmailTextFiled() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: TextEditingController(),
      style: TextStyle(color: colors.bgcolor),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(color: colors.bgcolor),
          fillColor: colors.fontcolor,
          prefixIcon: Icon(
            Icons.email,
            color: colors.bgcolor,
          ),
          labelText: "Enter Your Email*",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}

getNumberTextFiled() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: TextEditingController(),
      style: TextStyle(color: colors.bgcolor),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(color: colors.bgcolor),
          fillColor: colors.fontcolor,
          prefixIcon: Icon(
            Icons.numbers,
            color: colors.bgcolor,
          ),
          labelText: "Enter Your Number*",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}

getPasswordTextFiled() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      obscureText: true,
      controller: TextEditingController(),
      style: TextStyle(color: colors.bgcolor),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(color: colors.bgcolor),
          fillColor: colors.fontcolor,
          prefixIcon: Icon(
            Icons.key,
            color: colors.bgcolor,
          ),
          labelText: "Enter Your Password*",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}

appLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: colors.bgcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          'Login',
          style:
              TextStyle(color: colors.fontcolor, fontWeight: FontWeight.bold),
        )),
      ),
    ),
  );
}

appSignupButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: colors.bgcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          'Sign-up',
          style:
              TextStyle(color: colors.fontcolor, fontWeight: FontWeight.bold),
        )),
      ),
    ),
  );
}
