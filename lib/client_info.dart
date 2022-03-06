

import 'package:flutter/material.dart';
import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';
import 'package:provider/provider.dart';

import 'client_list.dart';
import 'edit_form.dart';
import 'models/client.dart';

class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({Key? key}) : super(key: key);

  @override
  _ClientInfoScreenState createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();

  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
          child: EditForm(),
        );
      });
    }
    return StreamProvider<List<Client>?>.value(
        value: DatabaseService(uid: '').clients,
        initialData: null,

        child: Scaffold(
          appBar: AppBar(
            title: const Text('Client Info'),
            centerTitle: true,
            actions: [
              IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit))
            ],
          ),
          body:
              ClientList(), /*SingleChildScrollView(
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
      ),    child: Column(
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide()))),
                    onPressed: () async {
                      dynamic result = await _auth.GuestLogin();
                      if (result == null) {
                        print('error signing in');
                      } else {
                        print('Guest loggrd in');
                        print(result.uid);
                      }
                    },
                    child: const Text('Submit'))
              ],
            ),*/
        ));
    //);
  }
}
