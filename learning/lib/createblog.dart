import 'package:flutter/material.dart';
import 'package:learning/const.dart';

import 'mybog(homescreen).dart';

class CreateBlog extends StatefulWidget {
  const CreateBlog({super.key});

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.bgcolor,
        title: Text(
          'New Blog',
          style: TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              color: colors.fontcolor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: colors.bgcolor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Take Picture",
                      style: TextStyle(
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          color: colors.fontcolor),
                    ),
                    Icon(
                      Icons.picture_in_picture,
                      color: colors.fontcolor,
                    ),
                  ],
                ),
              ),
            ),
            getEmailTextFiled(),
            getEmailTextFiled2(),
            appLoginButton(context)
          ],
        ),
      ),
    );
  }
}

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
          labelText: "Blog Title",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}

getEmailTextFiled2() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      maxLines: 5,
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
          labelText: "Blog Description",
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
          'Create',
          style:
              TextStyle(color: colors.fontcolor, fontWeight: FontWeight.bold),
        )),
      ),
    ),
  );
}
