import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learning/routesa/rmodal.dart';


class RoutesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Entries3> getList = [];

  Entries3 listModal = Entries3(
      );
  Future<void> getData() async {
    try {
      var reponse = await get(
          Uri.parse(
              'http://13.233.145.188:8080/bb/client/v1/drivers?pageNumber=1&pageSize=25'),
          headers: {
            'Authorization': 'Bearer dkjsu',
          });

      var data = json.decode(reponse.body.toString());

      print('reponse  of the Enteris 1 :::${reponse.body.toString()}');
      print('Data of the Enteris 1 :::${data}');

      if (reponse.statusCode == 200) {
        print('if');
        getList = (data['entries'] as List)
            .map((data) => Entries3.fromJson(data))
            .toList();
      } else {
        print('you are in else');
      }
    } catch (e) {
      print('Erroo or exception ${e.toString()}');
    }
  }
}
