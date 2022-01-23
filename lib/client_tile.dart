import 'package:flutter/material.dart';
import 'package:trial/models/client.dart';

class ClientTile extends StatelessWidget {
  //const ClientTile({Key? key}) : super(key: key);

  final Client client;
  ClientTile({required this.client});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blueAccent ,
          ),
          title: Text(client.username),
          subtitle: Text('Email: ${client.Email},phone: ${client.phone}, location: ${client.loc}'),

        ),
      ),
    );
  }
}
