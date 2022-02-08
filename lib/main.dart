import 'package:cloud_firestore/cloud_firestore.dart';

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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'outage_channel', //id
    'Outage Channel', //title
    //'This channel is used for outage notifications.',//description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A big message just showed u: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      //if(message.notification != null){
      print(message.notification!.body);
      print(message.notification!.title);
    }
  });

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //watchout
  // @override
  // void initState(){
  //   super.initState();
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification=message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if(notification != null && android != null){
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               //channel.description,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher',
  //             ),
  //           ));
  //     }
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('A new onMessageOpenedApp event was publisherfed');
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       showDialog(
  //           context: context,
  //           builder: (_){
  //         return AlertDialog(
  //           title: Text(notification.title ?? 'There was null value sorry:)'),
  //           content: SingleChildScrollView(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(notification.body ?? 'There was null value sorry:)')
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //     }
  //   });
  // }
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
        }
        //watchout

        ),
  ));
}
// @override
// void initState(){
//   super.initState();
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     RemoteNotification? notification=message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if(notification != null && android != null){
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               //channel.description,
//               color: Colors.blue,
//               playSound: true,
//               icon: '@mipmap/ic_launcher',
//             ),
//           ));
//     }
//   });
//}