// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class PushNotificationService{
//   final FirebaseMessaging _fcm =  FirebaseMessaging.instance;
//
//   Future initialise() async{
//     if (Platform.isAndroid){
//       _fcm.requestPermission();
//     }
//    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification!.android;
//
//    });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was publisherfed');
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         showDialog(
//             context: context,
//             builder: (_){
//               return AlertDialog(
//                 title: Text(notification.title ?? 'There was null value sorry:)'),
//                 content: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(notification.body ?? 'There was null value sorry:)')
//                     ],
//                   ),
//                 ),
//               );
//             });
//       }
//     }
//
//   }
// }