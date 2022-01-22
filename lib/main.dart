import 'package:trial/congratulations.dart';
import 'package:trial/first.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/wrapper.dart';
import 'package:trial/registration_screen.dart';
import 'package:trial/sign_in.dart';
import 'package:trial/client_info.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trial/home.dart';
import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( StreamProvider<Users?>.value(
    value: AuthService().user,
    initialData: null,
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/wrapper',
        routes:{
          '/wrapper':(context)=> const Wrapper(),
          '/home':(context)=>  HomeScreen(),
          '/first':(context)=>const FirstScreen(),
          //'/registration_screen':(context)=>RegistrationScreen(),
          '/congratulations':(context)=> CongratulationScreen(),
         // '/sign_in':(context)=>SignInScreen(toggleView: null,),
           '/client_info':(context)=>const ClientInfoScreen(),
        }

    ),
  ));
}

