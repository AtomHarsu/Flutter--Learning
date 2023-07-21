import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learning/creat/modal.dart';

class FileProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Entries> getList = [];

  Entries listModal = Entries(
      assignedRoute: '',
      created: '',
      registerednumber: '',
      createdBy: '',
      seating: '',
      status: '',
      trackingDeviceIdentifier: '',
      updated: '',
      updatedBy: '');
  Future<void> getData() async {
    try {
      var reponse = await get(
          Uri.parse(
              'http://13.233.145.188:8080/bb/client/v1/bus?pageNumber=1&pageSize=25'),
          headers: {
            'Authorization': 'Bearer dkjsu',
          });

      var data = json.decode(reponse.body.toString());

      print('reponse :::${reponse.body.toString()}');
      print('Data :::${data}');

      if (reponse.statusCode == 200) {
        print('if');
        getList = (data['entries'] as List)
            .map((data) => Entries.fromJson(data))
            .toList();
      } else {
        print('you are in else');
      }
    } catch (e) {
      print('Erroo or exception ${e.toString()}');
    }
  }
}
