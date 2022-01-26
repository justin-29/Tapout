import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';
import 'package:trial/shared/constants.dart';
import 'package:trial/shared/loading.dart';

class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> Location = [
    'Seawoods',
    'New Panvel',
    'Satara',
    'Kalamboli',
  ];

//form values
  String? _currentName;
  String? _currentLoc;
  String? _currentPhone;
  String? _currentEmail;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;

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
                    TextFormField(
                      initialValue: userData!.username,
                      validator: (val) =>
                          val!.isEmpty ? 'Enter a username' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Username'),
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userData.phone,
                      validator: (val) => val!.isEmpty ? 'Enter a phone' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Phone'),
                      onChanged: (val) => setState(() => _currentPhone = val),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userData.Email,
                      validator: (val) => val!.isEmpty ? 'Enter a email' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      onChanged: (val) => setState(() => _currentEmail = val),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userData.loc,
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
                          print(user.uid);
                          if(_formkey.currentState!.validate()){
                            await DatabaseService(uid: user.uid).updateUserData(
                                _currentName?? userData.username,
                                _currentPhone?? userData.phone,
                                _currentLoc?? userData.loc,
                                _currentEmail?? userData.Email);
                            Navigator.pop(context);
                          }
                        }),
                    const SizedBox(
                      height: 200,
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
