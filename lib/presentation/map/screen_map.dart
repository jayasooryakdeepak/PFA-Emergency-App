import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_app/core/constants.dart';

class ScreenMaps extends StatefulWidget {
  const ScreenMaps({super.key});

  @override
  State<ScreenMaps> createState() => _ScreenMapsState();
}

class _ScreenMapsState extends State<ScreenMaps> {
  static const LatLng sourceLocation = LatLng(9.957677, 76.343463);
  static const LatLng Destination = LatLng(9.965380, 76.340321);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapAPIKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(Destination.latitude, Destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(
            point.latitude,
            point.longitude,
          ),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  static const _initialCameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: 14.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.green,
          ),
        },
        markers: {
          const Marker(
            markerId: MarkerId("Source"),
            position: sourceLocation,
          ),
          Marker(
            markerId: MarkerId("Destination"),
            position: Destination,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
          ),
        },
      ),
    );
  }
}
