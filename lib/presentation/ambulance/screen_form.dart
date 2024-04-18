import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_app/db/database.dart';
import 'package:pfa_app/presentation/map/current_location_map.dart';
import 'package:random_string/random_string.dart';

class AmbuForm extends StatefulWidget {
  const AmbuForm({super.key});

  @override
  State<AmbuForm> createState() => _AmbuFormState();
}

class _AmbuFormState extends State<AmbuForm> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController placecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ambulance Form',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: placecontroller,
                decoration: const InputDecoration(
                  labelText: 'Place',
                ),
              ),
              TextFormField(
                controller: phonecontroller,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextFormField(
                controller: locationcontroller,
                decoration: const InputDecoration(
                  labelText: 'Landmark',
                ),
              ),
              
              ElevatedButton(
                onPressed: () async {
                  int phoneno = int.parse(phonecontroller.text);
                  String Id = randomAlphaNumeric(10);
                  Map<String, dynamic> ServiceInfomap = {
                    "Name": namecontroller.text,
                    "Place": placecontroller.text,
                    "Id":Id,
                    "Landmark": locationcontroller.text,
                    "Phone": phoneno.toInt()
                  };
                  await DatabaseMethods()
                      .addServiceRequest(ServiceInfomap, Id)
                      .then(
                    (value) {
                      Fluttertoast.showToast(
                          msg: "Employee Details Added Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  );
                },
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
        builder: (context) =>
            CurrentLocationMap(currentPosition: currentPosition),
      ),
    );
  }
}
