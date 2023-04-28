import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FastApiTest extends StatefulWidget {
  const FastApiTest({super.key});

  @override
  State<FastApiTest> createState() => _FastApiTestState();
}

class _FastApiTestState extends State<FastApiTest> {
  Future<void> getData() async {
    try {
      var response = await http.get(
          Uri.parse("http://10.201.0.190:8000/testendpoint"),
          headers: {'Content-type': 'application/json'});
      var data = jsonDecode(response.body.toString());

      print(data);
      if (response.statusCode == 200) {
        print('DATA :::: $data');
      } else {
        print('object');
      }
    } catch (e) {
      print("eroor :::: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('testing method'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text('data')),
      ),
    );
  }
}
