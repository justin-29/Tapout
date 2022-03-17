import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/notif.dart';
import 'package:trial/services/database.dart';
import 'package:trial/water_info.dart';
import 'package:trial/water_list.dart';

import 'dashboard.dart';
import 'notification_form.dart';
import 'notification_list.dart';
class NotificationInfoScreen extends StatefulWidget {
  const NotificationInfoScreen({Key? key}) : super(key: key);

  @override
  _NotificationInfoScreenState createState() => _NotificationInfoScreenState();
}

class _NotificationInfoScreenState extends State<NotificationInfoScreen> {

  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
          child: NotificationForm(),
        );
      });
    }
    return StreamProvider<List<Notif>?>.value(
        value: DatabaseService(uid: '').notifications,
        initialData: null,

        child: Scaffold(
        appBar: AppBar(
        title: const Text('Notification Info'),
    centerTitle: true,
    actions: [
    IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit)),IconButton(onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  WaterInfoScreen()));
      }, icon: const Icon(Icons.water))
    ],
    ),
    body:
    NotificationList(),
        ));
    //);
  }
}