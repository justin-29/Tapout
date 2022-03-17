import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'models/notif.dart';
import 'notification_tile.dart';

class WaterList extends StatefulWidget {
  const WaterList({Key? key}) : super(key: key);

  @override
  _WaterListState createState() => _WaterListState();
}

class _WaterListState extends State<WaterList> {
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




    final w = [];
    notifications.forEach((client) {
      if (client.mode =='Water') {
        w.add(client);
      }
    });



    //   print(client.username);
    //   print(client.phone);
    //   print(client.loc);
    //   print(client.Email);
    // });

    return ListView.builder(
      itemCount: w.length,
      itemBuilder: (BuildContext context, int index) {
        return NotificationTile(notif: w[index]);
      },
    );
  }
}