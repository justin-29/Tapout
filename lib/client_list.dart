import 'package:flutter/material.dart';
import 'package:trial/models/client.dart';
import 'package:provider/provider.dart';
import 'package:trial/services/database.dart';
import 'client_tile.dart';

import 'models/notif.dart';
import 'models/user.dart';

class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
  //   final user = Provider.of<Users?>(context);
  //   UserData? userData = snapshot.data;
  //   StreamBuilder<UserData>(
  //       stream: DatabaseService(uid: user!.uid).userData,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           UserData? userData = snapshot.data;

     final clients = Provider.of<List<Client>?>(context) ?? [];
     final notification = Provider.of<List<Notif>?>(context) ?? [];



    // final c = [];
    // clients.forEach((client) {
    //   notification.forEach((notification) {if (client.loc ==notification.loc) {
    //     c.add(client);
    //   } });
    //
    // });



    //   print(client.username);
    //   print(client.phone);
    //   print(client.loc);
    //   print(client.Email);
    // });

    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (BuildContext context, int index) {
        return ClientTile(client: clients[index]);
      },
    );
  }
 }
//         });
//   }}
