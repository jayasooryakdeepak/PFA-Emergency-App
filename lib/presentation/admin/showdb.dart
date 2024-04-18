import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pfa_app/db/database.dart';

class ShowReq extends StatefulWidget {
  const ShowReq({super.key});

  @override
  State<ShowReq> createState() => _ShowReqState();
}

class _ShowReqState extends State<ShowReq> {
  Stream? RequestsStream;

  getontheload() async {
    RequestsStream = await DatabaseMethods().getServiceRequests();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allServiceRequests() {
    return StreamBuilder(
      stream: RequestsStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  String ph = ds["Phone"].toString();
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name : " + ds["Name"],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Phone : " + ph,
                              style: TextStyle(
                                  color: Colors.lightBlue[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Place :" + ds["Place"],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 55, 0, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Landmark :" + ds["Landmark"],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 115, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Request_Type :" + ds["Request_Type"],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Service_Type :" + ds["Service_Type"],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 148, 5, 5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [Text("Show Requests")],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
            Expanded(
              child: allServiceRequests(),
            ),
          ],
        ),
      ),
    );
  }
}
