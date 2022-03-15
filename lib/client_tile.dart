import 'package:flutter/material.dart';
import 'package:trial/edit_form.dart';
import 'package:trial/models/client.dart';

class ClientTile extends StatelessWidget {
  //const ClientTile({Key? key}) : super(key: key);





  final Client client;
  ClientTile({required this.client});

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
    return
      Padding(
      padding: EdgeInsets.only(top: 8.0),
      // InkWell(
      //   onTap: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) =>
      //              Container(
      //         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
      //       child: _showSettingsPanel()));
      //   },
         child:
        Card(
        margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blueAccent ,

          ),
          title: Text(client.username),
          subtitle: Text('Email: ${client.Email},phone: ${client.phone}, location: ${client.loc}'),
        //   trailing: IconButton(onPressed: ()=>_showSettingsPanel(), icon: const Icon(Icons.edit),
        //
        // ),
      ),
        )
    );
  }
}
