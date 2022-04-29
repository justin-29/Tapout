import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/edit_notification_form.dart';
import 'package:trial/models/notif.dart';

import 'models/noti.dart';

class NotificationTile extends StatelessWidget {
  //const ClientTile({Key? key}) : super(key: key);
  final Notif notif;
  NotificationTile({required this.notif});

  @override
  Widget build(BuildContext context) {
    final notification = Provider.of<noti?>(context);
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
          child: EditNotificationForm(),//uid:notification!.uid),
        );
      });
    }
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
          title: Text('Mode: ${notif.mode}\nDate: ${notif.date}\nTime: ${notif.time}'),
          subtitle: Text('Reason: ${notif.reason}\nlocation: ${notif.loc}'),
          //trailing: IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit),
          // trailing: IconButton(onPressed: ()=>FirebaseFirestore.instance.collection('notifications').doc(notifications.docId).delete(), icon: const Icon(Icons.delete),
          // ),

        ),
      ),
    );
  }
}
