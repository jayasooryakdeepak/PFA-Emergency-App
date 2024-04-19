import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pfa_app/db/database.dart';
import 'package:pfa_app/presentation/map/current_location_map.dart';
import 'package:random_string/random_string.dart';

class AcciForm extends StatefulWidget {
  const AcciForm({super.key});

  @override
  State<AcciForm> createState() => _AcciFormState();
}

class _AcciFormState extends State<AcciForm> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController placecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  
  late String req;
  late String ser;

  @override

// void initState() {
//     super.initState();
//     req = widget.req_type;
//     ser = widget.ser_type;
//   }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              // TextFormField(
              //   controller: namecontroller,
              //   decoration: const InputDecoration(
              //     labelText: 'Name',
              //   ),
              // ),
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
                keyboardType: TextInputType.number,
                // nullable: true,
                // initialValue: "9955778697",
              ),
              // TextFormField(
              //   controller: locationcontroller,
              //   decoration: const InputDecoration(
              //     labelText: 'Landmark',
              //   ),
              // ),
              ElevatedButton(
                onPressed: () async {
                  int? phoneno;
                  if (phonecontroller.text.isEmpty) {
                    phoneno = 0;
                  } else {
                    phoneno = int.parse(phonecontroller.text);
                  }
                  String Id = randomAlphaNumeric(10);
                  String loc1 = randomNumeric(6);
                  String loc2 = randomNumeric(6);
                  String tm = randomBetween(6, 15).toString();

                  Map<String, dynamic> AccidentInfomap = {
                    "Place": placecontroller.text,
                    "Id":Id,
                    "Request_Type":"Accident",
                    "Service_Type":"Ambulance",
                    "Landmark": locationcontroller.text,
                    "Phone": phoneno,
                    "Coordinates":'9.'+loc1+', 76.'+loc2
                  };
                  await DatabaseMethods()
                      .addAccident(AccidentInfomap, Id)
                      .then(
                    (value) {
                      Fluttertoast.showToast(
                          msg: "Help will Arrive in "+ tm +" minute",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[200],
                  textStyle: TextStyle(color: Colors.red)
                ),
                child: const Text('Submit'),
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


