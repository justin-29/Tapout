import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          //channel.description,
        ),
      ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //'This channel is used for important notifications.', // description
  importance: Importance.high,
);


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  FirebaseMessaging.onMessage.listen(_firebasePushHandler); //vasu
  // AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Color(0xFF9D50DD),
  //       ledColor: Colors.white)
  // ]);

  // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //   if (!isAllowed) {
  //     // This is just a basic example. For real apps, you must show some
  //     // friendly dialog box before call the request method.
  //     // This is very important to not harm the user experience
  //     AwesomeNotifications().requestPermissionToSendNotifications();
  //   }
  // });
  runApp(StreamProvider<Users?>.value(
    value: AuthService().user,
    initialData: null,
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/wrapper',
        routes: {
          '/wrapper': (context) => const Wrapper(),
          '/home': (context) => HomeScreen(),
          '/first': (context) => const FirstScreen(),
          //'/registration_screen':(context)=>RegistrationScreen(),
          '/congratulations': (context) => CongratulationScreen(),
          // '/sign_in':(context)=>SignInScreen(toggleView: null,),
          '/client_info': (context) => const ClientInfoScreen(),
        }),
  ));
}

Future<void> _firebasePushHandler(RemoteMessage message) async {
  //message from firebase console showed
  print("Message from push notification is test");
  //firebase push notification
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}
