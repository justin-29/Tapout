import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/services/database.dart';
import 'package:provider/provider.dart';

class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({Key? key}) : super(key: key);

  @override
  _ClientInfoScreenState createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();

  final AuthService _auth = AuthService();




  @override
  Widget build(BuildContext context) {
    final clients= Provider.of<QuerySnapshot>(context);
    print(clients);
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().clients,
      initialData: ,
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Client Info'),
        centerTitle: true,
        actions: [IconButton(onPressed: (

            ) {}, icon: const Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.account_circle,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: TextFormField(
                controller: phone,
                decoration: const InputDecoration(hintText: 'Phone Number'),
              ),
              trailing: IconButton(
                onPressed: () {
                  phone.clear();
                },
                icon: const Icon(Icons.clear, color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.place),
              title: TextFormField(
                controller: location,
                decoration: const InputDecoration(hintText: 'Location'),
              ),
              trailing: IconButton(
                onPressed: () {
                  location.clear();
                },
                icon: const Icon(Icons.clear, color: Colors.black),
              ),
            ),
            TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide()))),
                onPressed: () async {

                  dynamic result = await _auth.GuestLogin();
                  if (result == null){
                    print('error signing in');
                  }else{
                    print( 'Guest loggrd in');
                    print(result.uid);
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
      )
    );
  }
}
