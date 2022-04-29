import 'package:flutter/material.dart';
import 'package:trial/models/notif.dart';
import 'package:provider/provider.dart';
import 'package:trial/services/database.dart';
import 'client_tile.dart';
import 'models/user.dart';
import 'notification_tile.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    //   final user = Provider.of<Users?>(context);
    //   UserData? userData = snapshot.data;
    //   StreamBuilder<UserData>(
    //       stream: DatabaseService(uid: user!.uid).userData,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           UserData? userData = snapshot.data;

    final notifications = Provider.of<List<Notif>?>(context) ?? [];

    final e = [];
    notifications.forEach((client) {
      if (client.mode =='Electricity') {
        e.add(client);
      }
    });
    //   print(client.username);
    //   print(client.phone);
    //   print(client.loc);
    //   print(client.Email);
    // });

    return ListView.builder(
      itemCount: e.length,
      itemBuilder: (BuildContext context, int index) {
        return NotificationTile(notif: e[index]);
      },
    );
  }
}
//         });
//   }}
