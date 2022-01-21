import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userdata = FirebaseFirestore.instance.collection(
      'userdata');

  Future updateUserData(String username, String phone, String loc,
      String Email) async {
    return await userdata.doc(uid).set({
      'username': username,
      'phone': phone,
      'loc': loc,
      'Email': Email,
    });
  }
}