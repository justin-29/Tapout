import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/services/database.dart';
import 'package:trial/user_water_info.dart';

import 'models/notif.dart';
import 'notification_list.dart';

class UserNotificationInfoScreen extends StatefulWidget {
  const UserNotificationInfoScreen({Key? key}) : super(key: key);

  @override
  _UserNotificationInfoScreenState createState() => _UserNotificationInfoScreenState();
}

class _UserNotificationInfoScreenState extends State<UserNotificationInfoScreen> {

  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // void _showSettingsPanel(){
    //   showModalBottomSheet(context: context, builder: (context) {
    //     return Container(
    //       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
    //       child: NotificationForm(),
    //     );
    //   });
    // }
    return StreamProvider<List<Notif>?>.value(
        value: DatabaseService(uid: '').notifications,
        initialData: null,

        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notification Info'),
            centerTitle: true,
            actions: [
              //IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit)),
              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  UserWaterInfoScreen()));
              }, icon: const Icon(Icons.water))
            ],
          ),
          body:
          NotificationList(),
        ));
    //);
  }
}