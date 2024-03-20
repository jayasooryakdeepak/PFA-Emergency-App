import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationMap extends StatelessWidget {
  final LatLng? currentPosition;

  const CurrentLocationMap({super.key, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: currentPosition!,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId("CurrentLocation"),
            position: currentPosition!,
          ),
        },
      ),
    );
  }
}