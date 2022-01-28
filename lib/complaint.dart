import 'dart:ui';

import 'package:flutter/material.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  TextEditingController _nameController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        title: Text('Register your complaint'),
        centerTitle: true,
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/complainn.jpg'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Your Name",
                        hintStyle: TextStyle(fontSize: 18),
                        labelText: "Name",
                        errorText: null,
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade800),
                            borderRadius:
                                BorderRadius.all(Radius.circular(17))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(17)))),
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Your phone no.",
                        hintStyle: TextStyle(fontSize: 18),
                        labelText: "Phone",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade800),
                            borderRadius:
                                BorderRadius.all(Radius.circular(17))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(17)))),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    maxLines: 1,
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Your E-mail",
                        hintStyle: TextStyle(fontSize: 18),
                        labelText: "E-mail",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade800),
                            borderRadius:
                                BorderRadius.all(Radius.circular(17))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(17)))),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 375,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your complaint here",
                      hintStyle: TextStyle(fontSize: 18),
                      //labelText: "E-mail",
                      //labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: InputBorder.none,
                      fillColor: Colors.white38,
                      filled: true,
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 8,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      print("Name" + _nameController.text);
                    }),
              ],
            ))),
      ),
    );
  }
}
// void main() {
  
//   String namelen;

//   runApp(MaterialApp(
//       home: 

  

    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: AssetImage(
    //         'D:\BC\New folder\flutter_application_1\build\flutter_assets\3599451.jpg'),
    //     fit: BoxFit.cover,
    //   ),
    // ),
  



