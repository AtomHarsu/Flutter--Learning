import 'package:flutter/material.dart';
import 'package:learning/const.dart';

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
            Container(
              padding: EdgeInsets.all(8.0),
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
            )
          ],
        ),
      ),
    );
  }
}
