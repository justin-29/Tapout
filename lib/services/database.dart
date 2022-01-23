import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial/models/client.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});
  DatabaseService.withoutUID():uid="";

  //collection reference
  final CollectionReference userdata = FirebaseFirestore.instance.collection(
      'clients');

  Future updateUserData(String username, String phone, String loc,
      String Email) async {
    return await userdata.doc(uid).set({
      'username': username,
      'phone': phone,
      'loc': loc,
      'Email': Email,
    });
  }
    //client list from snapshot
  List<Client> _clientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Client(
          Email: doc['Email'] ?? '',
          loc: doc['loc'] ?? '',
          phone: doc['phone'] ?? '0',
          username: doc['username'] ?? ''
         );
    }).toList();
  }
  //get userdata
  Stream<List<Client>>? get clients{
    return userdata.snapshots()
        .map(_clientListFromSnapshot);
  }

}

