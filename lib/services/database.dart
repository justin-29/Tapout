import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial/models/client.dart';
import 'package:trial/models/notif.dart';
import 'package:trial/models/noti.dart';
import 'package:trial/models/user.dart';
import 'package:trial/models/complaint.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  DatabaseService.withoutUID() :uid="";

  //collection reference
  final CollectionReference userdata = FirebaseFirestore.instance.collection(
      'clients');

  final CollectionReference notifi = FirebaseFirestore.instance.collection(
      'notifications');

  final CollectionReference comp = FirebaseFirestore.instance.collection(
      'Complaints');


  // CLIENT LIST

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

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      username: snapshot['username'],
      phone: snapshot['phone'],
      Email: snapshot['Email'],
      loc: snapshot['loc'],
    );
  }

  //get client stream userdata
  Stream<List<Client>>? get clients {
    return userdata.snapshots()
        .map(_clientListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return userdata.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }


// NOTIFICATION LIST

  noti _notiFromSnapshot(DocumentSnapshot snapshot) {
    return noti(
      uid: uid,
      time: snapshot['time'],
      date: snapshot['date'],
      reason: snapshot['reason'],
      loc: snapshot['loc'],
    );
  }

  Future updateNotifi(String time, String date, String reason,
      String loc) async {
    return await notifi.doc(uid).set({
      'time': time,
      'date': date,
      'loc': loc,
      'reason': reason,
    });
  }

  List<Notif> _notificaitonListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Notif(
          time: doc['time'] ?? '',
          loc: doc['loc'] ?? '',
          date: doc['date'] ?? '',
          reason: doc['reason'] ?? ''
      );
    }).toList();
  }

  Stream<List<Notif>>? get notifications {
    return notifi.snapshots()
        .map(_notificaitonListFromSnapshot);
  }

Stream<noti> get notif {
  return notifi.doc(uid).snapshots()
      .map(_notiFromSnapshot);
}


    // COMPLAINTS

    List<Complaint> _complaintsListFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        //print(doc.data);
        return Complaint(
            complaint: doc['complaint'] ?? '',
            name: doc['name'] ?? '',
            email: doc['email'] ?? '',
            phone: doc['phone'] ?? ''
        );
      }).toList();
    }
    Stream<List<Complaint>>? get complaints{
      return comp.snapshots()
          .map(_complaintsListFromSnapshot);
    }
  }

