import 'package:flutter/material.dart';
import 'package:trial/models/notif.dart';

class NotificationTile extends StatelessWidget {
  //const ClientTile({Key? key}) : super(key: key);

  final Notif notif;
  NotificationTile({required this.notif});

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
          title: Text('Date: ${notif.date},Time: ${notif.time}'),
          subtitle: Text('Reason: ${notif.reason},location: ${notif.loc}'),

        ),
      ),
    );
  }
}
