import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScreenMaps extends StatefulWidget {
  const ScreenMaps({super.key});

  @override
  State<ScreenMaps> createState() => _ScreenMapsState();
}

class _ScreenMapsState extends State<ScreenMaps> {

  static const LatLng sourceLocation = LatLng(9.9707186, 76.3420201);
  static const LatLng Destination = LatLng(9.9707186, 76.3420201);


  static const _initialCameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: 11.5,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: {
          Marker(
          markerId: MarkerId("Source"),
          position: sourceLocation,
        ),
        }
      ),
    );
  }
}
