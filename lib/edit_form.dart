import 'package:flutter/material.dart';
import 'package:trial/shared/constants.dart';


class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

final _formkey =GlobalKey<FormState>();
final List<String> Location=['Seawoods','New Panvel','Satara','Kalamboli'];

//form values
  String? _currentName;
  String? _currentLoc;
  String? _currentPhone;
    String? _currentEmail;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children:  [

            SizedBox(height: 10,),Text(
              'Update your info',
              style: TextStyle(fontSize:18.0, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 15,),
          TextFormField(
            validator: (val)=>val!.isEmpty ? 'Enter a username':null ,
            decoration:  textInputDecoration.copyWith(hintText: 'Username'),
            onChanged: (val)=>setState(()=> _currentName=val),
          ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val)=>val!.isEmpty ? 'Enter a phone':null ,
              decoration:  textInputDecoration.copyWith(hintText: 'Phone'),
              onChanged: (val)=>setState(()=> _currentPhone=val),
            ),

            SizedBox(height: 20,)
            ,TextFormField(
              validator: (val)=>val!.isEmpty ? 'Enter a email':null ,
              decoration:  textInputDecoration.copyWith(hintText: 'Email'),
              onChanged: (val)=>setState(()=> _currentEmail=val),
            ),
            SizedBox(height: 20,),
            //dropdown
            DropdownButtonFormField(
              decoration: textInputDecoration,
              hint: Text('Select Location'),
              items: Location.map((loc) {
                return new DropdownMenuItem(
                  value: loc,
                  child: Text('$loc area'),
                );
              }).toList(),
              onChanged: (value)=>setState(()=> _currentLoc=value as String?)
            ),

            SizedBox(height: 20,),
            ElevatedButton(
              //color: Colors.green,
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()async{
                  print(_currentEmail);
                  print(_currentName);
                  print(_currentPhone);
                  print(_currentLoc);
                }),
            SizedBox(height: 120,),
          ],
        ),
      ),

    );
  }
}




















































































































































































































































































































