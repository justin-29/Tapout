import 'package:flutter/material.dart';
import 'package:trial/client_info.dart';
import 'package:trial/registration_screen.dart';
import 'package:trial/home.dart';
import 'package:trial/sign_in.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


 bool showSignIn=true;
  void toggleView(){
    setState(() => showSignIn =! showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignInScreen(toggleView: toggleView);
    }else{
      return RegistrationScreen(toggleView: toggleView);
    }
  }
}