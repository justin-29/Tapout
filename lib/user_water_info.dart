import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/services/database.dart';
import 'package:trial/water_list.dart';

import 'models/notif.dart';

class UserWaterInfoScreen extends StatefulWidget {
  const UserWaterInfoScreen({Key? key}) : super(key: key);

  @override
  _UserWaterInfoScreenState createState() => _UserWaterInfoScreenState();
}

class _UserWaterInfoScreenState extends State<UserWaterInfoScreen> {

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
            // actions: [
            //   IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit)),
            //   // IconButton(onPressed: (){
            //   //   Navigator.push(
            //   //       context,
            //   //       MaterialPageRoute(
            //   //           builder: (context) => NotificationInfoScreen()));
            //   // }, icon: const Icon(Icons.bolt))
            // ],
          ),
          body:
          WaterList(),
        ));
    //);
  }
}