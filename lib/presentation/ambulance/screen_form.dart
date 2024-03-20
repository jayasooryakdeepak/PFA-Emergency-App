import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_app/presentation/map/current_location_map.dart';

class AmbuForm extends StatelessWidget {
  const AmbuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Place',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Landmark',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  getCurrentLocation(context);
                },
                child: const Text('Select Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCurrentLocation(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Location permissions are denied
        print("Permission Denied");
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng? currentPosition;
    currentPosition = LatLng(position.latitude, position.longitude);
    print(currentPosition);

    // Send the currentPosition variable to the screen map file
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrentLocationMap(currentPosition: currentPosition),
      ),
    );
  }
}

