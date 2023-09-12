import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GogleMapFLutter extends StatefulWidget {
  const GogleMapFLutter({super.key});

  @override
  State<GogleMapFLutter> createState() => _GogleMapFLutterState();
}

class _GogleMapFLutterState extends State<GogleMapFLutter> {
  GoogleMapController? gController;

  CameraPosition kgooglemap = const CameraPosition(
    target: LatLng(
      37.4296133580664,
      -122.085749655962,
    ),
    zoom: 10.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Integration'),
      ),
      body: GoogleMap(
        initialCameraPosition: kgooglemap,
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          gController = controller;
        },
      ),
    );
  }
}
