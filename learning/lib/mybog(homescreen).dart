import 'package:flutter/material.dart';
import 'package:learning/const.dart';

import 'createblog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: colors.bgcolor,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Flutter Blog App",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: colors.fontcolor),
                ),
                Text("V 1.0.1",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors.fontcolor))
              ],
            )),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CreateBlog()));
              },
              icon: Icon(Icons.add))
        ],
        backgroundColor: colors.bgcolor,
        title: Text(
          'My Blogs',
          style: TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              color: colors.fontcolor),
        ),
        centerTitle: true,
      ),
    );
  }
}
