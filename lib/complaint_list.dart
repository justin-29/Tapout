import 'package:flutter/material.dart';
import 'package:trial/models/complaint.dart';
import 'package:trial/models/notif.dart';
import 'package:provider/provider.dart';
import 'package:trial/services/database.dart';
import 'client_tile.dart';
import 'complaint_tile.dart';
import 'models/user.dart';
import 'notification_tile.dart';

class ComplaintList extends StatefulWidget {
  const ComplaintList({Key? key}) : super(key: key);

  @override
  _ComplaintListState createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {
  @override
  Widget build(BuildContext context) {
    //   final user = Provider.of<Users?>(context);
    //   UserData? userData = snapshot.data;
    //   StreamBuilder<UserData>(
    //       stream: DatabaseService(uid: user!.uid).userData,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           UserData? userData = snapshot.data;

    final complaints = Provider.of<List<Complaint>?>(context) ?? [];




    // final c = [];
    // clients.forEach((client) {
    //   if (client.username =='Ojas') {
    //     c.add(client);
    //   }
    // });



    //   print(client.username);
    //   print(client.phone);
    //   print(client.loc);
    //   print(client.Email);
    // });

    return ListView.builder(
      itemCount:complaints.length,
      itemBuilder: (BuildContext context, int index) {
        return ComplaintTile(complaint: complaints[index]);
      },
    );
  }
}
//         });
//   }}
