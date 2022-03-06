import 'package:flutter/material.dart';
import 'package:trial/models/notif.dart';

import 'models/complaint.dart';

class ComplaintTile extends StatelessWidget {
  //const ClientTile({Key? key}) : super(key: key);

  final Complaint complaint;
  ComplaintTile({required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
        child: ListTile(
          // leading: CircleAvatar(
          //   radius: 25.0,
          //   backgroundColor: Colors.blueAccent ,
          //
          // ),
          title: Text('Name: ${complaint.name}\n${complaint.complaint}'),
          subtitle: Text('phone: ${complaint.phone},email: ${complaint.email}'),

        ),
      ),
    );
  }
}
