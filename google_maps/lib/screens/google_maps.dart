import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(AppGoogleMaps());

class AppGoogleMaps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-12.136602955899265, -77.02315437400709),
    zoom: 15,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-12.136602955899265, -77.02315437400709),
      tilt: 59,
      zoom: 19);

  @override
  Widget build(BuildContext context) {
    Set<Marker> marcadores = new Set<Marker>();
    marcadores.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: LatLng(-12.136602955899265, -77.02315437400709),
    )
    );
    return new Scaffold(
     body: GoogleMap(
      myLocationButtonEnabled: false,
       mapType: MapType.normal,
     markers: marcadores,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
      },
        
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Museo Arte de Lima!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

