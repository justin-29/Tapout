import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial/services/dart_client.dart';
//import 'package:provider/provider.dart';
//import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';
import 'package:trial/shared/constants.dart';
import 'package:trial/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationForm extends StatefulWidget {
  NotificationForm({Key? key}) : super(key: key);

  @override
  _NotificationFormState createState() => _NotificationFormState();
}

class _NotificationFormState extends State<NotificationForm> {
  CollectionReference notifi =
      FirebaseFirestore.instance.collection('notifications');
  // TextEditingController name= TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final List<String> Mode = [
    'Electricity',
    'Water',
  ];
//form values
  String? _currentDate;
  String? _currentTime;
  String? _currentReason;
  String? _currentLoc;
  String? _currentMode;
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<Users?>(context);
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Add new notification',
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
              //initialValue: userData!.username,
              validator: (val) =>
                  val!.isEmpty ? 'Enter a date in string' : null,
              decoration: textInputDecoration.copyWith(hintText: 'Date'),
              onChanged: (val) => setState(() => _currentDate = val),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //initialValue: userData.phone,
              validator: (val) =>
                  val!.isEmpty ? 'Enter a time in string' : null,
              decoration: textInputDecoration.copyWith(hintText: 'Time'),
              onChanged: (val) => setState(() => _currentTime = val),
            ),

            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //initialValue: userData.Email,
              validator: (val) => val!.isEmpty ? 'Enter duration/reason' : null,
              decoration:
                  textInputDecoration.copyWith(hintText: 'Duration/Reason'),
              onChanged: (val) => setState(() => _currentReason = val),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //initialValue: userData.loc,
              validator: (val) => val!.isEmpty ? 'Enter a Location' : null,
              decoration: textInputDecoration.copyWith(hintText: 'Location'),
              onChanged: (val) => setState(() => _currentLoc = val),
            ),
            const SizedBox(
              height: 20,
            ),
            // dropdown
            DropdownButtonFormField(
              decoration: textInputDecoration,
              //value: (_currentLoc ?? userData.loc).toString(),
              hint: const Text('Select'),
              items: Mode.map((thing) {
                return DropdownMenuItem(
                  value: thing,
                  child: Text('$thing'),
                );
              }).toList(),
              onChanged: (value) =>
                  setState(() => _currentMode = value as String?),
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                //color: Colors.green,
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  DioClient _dioClient = DioClient();
                  _dioClient.sendNotification(
                      title: _currentMode!, reason: _currentReason!);
                  // print(_currentEmail);
                  // print(_currentName);
                  // print(_currentPhone);
                  // print(_currentLoc);
                  //print(user.uid);
                  if (_formkey.currentState!.validate()) {
                    await notifi.add({
                      'date': _currentDate,
                      'time': _currentTime,
                      'loc': _currentLoc,
                      'reason': _currentReason,
                      'mode': _currentMode,
                      'created':FieldValue.serverTimestamp()
                    }).then((value) => print('Notification registered'));
                    // AwesomeNotifications().createNotification(
                    //     content: NotificationContent(
                    //         id: 10,
                    //         channelKey: 'basic_channel',
                    //         title: '$_currentMode Notification',
                    //         body: _currentReason));
                    Navigator.pop(context); //,name.text);
                  }
                }),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
