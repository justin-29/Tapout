// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onMessage.listen(_firebasePushHandler);

//   // AwesomeNotifications().initialize(null, [
//   //   NotificationChannel(
//   //       channelKey: 'basic_channel',
//   //       channelName: 'Basic notifications',
//   //       channelDescription: 'Notification channel for basic tests',
//   //       defaultColor: Color(0xFF9D50DD),
//   //       ledColor: Colors.white)
//   // ]
//   //);
// }

// Future<void> _firebasePushHandler(RemoteMessage message) async { //message from firebase console showed
//   print("Message from push notification is ${message.data}");
//   //firebase push notification
//   AwesomeNotifications().createNotificationFromJsonData(message.data);
// }
