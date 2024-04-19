import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  //CREATE
  Future addServiceRequest(
      Map<String, dynamic> ServiceInfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Service_Request")
        .doc(id)
        .set(ServiceInfomap);
  }

  //CREATE
  Future addAccident(
      Map<String, dynamic> AccidentInfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Accident_Report")
        .doc(id)
        .set(AccidentInfomap);
  }

  


  //READ
  Future<Stream<QuerySnapshot>> getServiceRequests() async {
    return await FirebaseFirestore.instance.collection("Service_Request").snapshots();
  }

  //UPDATE

  Future updateEmployeeDetail(String id, Map<String, dynamic> updateInfo)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).update(updateInfo);
  }

  //DELETE

  Future deleteEmployeeDetail(String id)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }
}
