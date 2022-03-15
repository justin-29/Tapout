import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'package:trial/models/noti.dart';
import 'package:trial/services/database.dart';
import 'package:trial/shared/constants.dart';
import 'package:trial/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/noti.dart';

class EditNotificationForm extends StatefulWidget {

  late String uid;
  //EditNotificationForm(this.uid);
  EditNotificationForm({Key? key}) : super(key: key);

  @override
  _EditNotificationFormState createState() => _EditNotificationFormState();
}

class _EditNotificationFormState extends State<EditNotificationForm> {
  CollectionReference notifi =
  FirebaseFirestore.instance.collection('notifications');
late String uid;
  // TextEditingController name= TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final List<String> Location = [
    'Seawoods',
    'New Panvel',
    'Satara',
    'Kalamboli',
  ];

//form values
  String? _currentDate;
  String? _currentTime;
  String? _currentReason;
  String? _currentLoc;

  @override
  Widget build(BuildContext context) {
    final notification = Provider.of<Noti?>(context);

    return StreamBuilder<noti>(
        stream: DatabaseService(uid: notification!.uid).notif,

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            noti? NOTI = snapshot.data;

            return Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Update your info',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //DatePickerDateTimeOrder(),
                    TextFormField(
                      //controller: name,
                      initialValue: NOTI!.time,
                      validator: (val) =>
                      val!.isEmpty ? 'Enter a time' : null,
                      decoration:
                      textInputDecoration.copyWith(hintText: 'time'),
                      onChanged: (val) => setState(() => _currentTime = val),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: NOTI.date,
                      validator: (val) => val!.isEmpty ? 'Enter a date' : null,
                      decoration:
                      textInputDecoration.copyWith(hintText: 'Date'),
                      onChanged: (val) => setState(() => _currentDate = val),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: NOTI.reason,
                      validator: (val) => val!.isEmpty ? 'Enter a reason' : null,
                      decoration:
                      textInputDecoration.copyWith(hintText: 'Reason'),
                      onChanged: (val) => setState(() => _currentReason = val),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue:NOTI.loc,
                      validator: (val) => val!.isEmpty ? 'Enter a Location' : null,
                      decoration:
                      textInputDecoration.copyWith(hintText: 'Location'),
                      onChanged: (val) => setState(() => _currentLoc = val),
                    ),
                    //dropdown
                    // DropdownButtonFormField(
                    //     decoration: textInputDecoration,
                    //     //value: (_currentLoc ?? userData.loc).toString(),
                    //     hint: const Text('Select Location'),
                    //     items: Location.map((loc) {
                    //       return DropdownMenuItem(
                    //         value: loc,
                    //         child: Text('$loc area'),
                    //       );
                    //     }).toList(),
                    //     onChanged: (value) =>
                    //         setState(() => _currentLoc = value as String?)
                    // ),

                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      //color: Colors.green,
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          // print(_currentEmail);
                          // print(_currentName);
                          // print(_currentPhone);
                          // print(_currentLoc);
                          //print(user.uid);
                          if(_formkey.currentState!.validate()){
                            await DatabaseService(uid: notification.uid).updateNotifi(
                                _currentTime?? NOTI.time,
                                _currentDate?? NOTI.date,
                                _currentLoc?? NOTI.loc,
                                _currentReason?? NOTI.reason);
                            //print(userData.username);
                            Navigator.pop(context,NOTI.date);//,name.text);
                          }
                        }),
                    const SizedBox(
                      height: 100,
                    ),
                    // ElevatedButton(
                    //   //color: Colors.green,
                    //     child: const Text(
                    //       'DAlete',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     onPressed: () async {
                    //       // print(_currentEmail);
                    //       // print(_currentName);
                    //       // print(_currentPhone);
                    //       // print(_currentLoc);
                    //       //print(user.uid);
                    //       //if(_formkey.currentState!.validate()){
                    //         //await notifi.document(snapshot.data.documents[index]['uid']).delete();
                    //         //print(userData.username);
                    //         Navigator.pop(context);//,name.text);
                    //       }
                    //     }),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
