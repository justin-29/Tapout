import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/complaint.dart';
import 'package:trial/services/database.dart';

import 'complaint_list.dart';
import 'notification_form.dart';
import 'notification_list.dart';
class ComplaintInfoScreen extends StatefulWidget {
  const ComplaintInfoScreen({Key? key}) : super(key: key);

  @override
  _ComplaintInfoScreenState createState() => _ComplaintInfoScreenState();
}

class _ComplaintInfoScreenState extends State<ComplaintInfoScreen> {

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
    return StreamProvider<List<Complaint>?>.value(
        value: DatabaseService(uid: '').complaints,
        initialData: null,

        child: Scaffold(
          appBar: AppBar(
            title: const Text('Complaint Info'),
            centerTitle: true,
            actions: [
              //IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit))
            ],
          ),
          body:
          ComplaintList(),
        ));
    //);
  }
}