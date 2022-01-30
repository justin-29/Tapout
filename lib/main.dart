import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onMessage.listen(_firebasePushHandler);//vasu
  // AwesomeNotifications().initialize(
  //     null,
  //     [
  //       NotificationChannel(
  //           channelKey: 'basic_channel',
  //           channelName: 'Basic notifications',
  //           channelDescription: 'Notification channel for basic tests',
  //           defaultColor: Color(0xFF9D50DD),
  //           ledColor: Colors.white
  //       )
  //     ]
  // ); //vasu

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

// Future<void> _firebasePushHandler(RemoteMessage message) async { //message from firebase console showed
//   print("Message from push notification is ${message.data}");
//   //firebase push notification
//   AwesomeNotifications().createNotificationFromJsonData(message.data);
// }//vasu