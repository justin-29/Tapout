import 'package:flutter/material.dart';
import 'package:trial/models/client.dart';
import 'package:provider/provider.dart';

import 'client_tile.dart';

class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    final clients= Provider.of<List<Client>?>(context);
    clients!.forEach((client) {
      print(client.username);
      print(client.phone);
      print(client.loc);
      print(client.Email);
    });

    return ListView.builder(itemCount: clients.length, itemBuilder: (BuildContext context, int index) {
      return ClientTile(client: clients[index]);
    },
    );
  }

}
