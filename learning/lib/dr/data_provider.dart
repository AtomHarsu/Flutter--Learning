import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'drmodal.dart';

class DataProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Entries1> getList = [];

  Entries1 listModal = Entries1(
      assignedBusDisplayName: '',
      assignedBusRef: '',
      assignedRouteDisplayName: '',
      assignedRouteRef: '',
      email: '',
      identifier: '',
      licenseBackUrl: '',
      licenseFrontUrl: '',
      name: '',
      phone: '',
      profileUrl: '',
      status: '');
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
            .map((data) => Entries1.fromJson(data))
            .toList();
      } else {
        print('you are in else');
      }
    } catch (e) {
      print('Erroo or exception ${e.toString()}');
    }
  }
}
