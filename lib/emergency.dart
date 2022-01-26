import 'package:flutter/material.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('TAP OUT Emergency'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/tower2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
        Card(
        margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/BoQUq1FnM3HcgRFyfl8vj45aof-waeGdcX9rgZOGkD4ToGXUIG1KnTQOGNurrSlUpx0') ,

          ),
          title: Text('022-349231'),
          subtitle: Text('MSEB Hotline'),

        ),
    ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/BoQUq1FnM3HcgRFyfl8vj45aof-waeGdcX9rgZOGkD4ToGXUIG1KnTQOGNurrSlUpx0') ,

                ),
                title: Text('mseb@gmail.com'),
                subtitle: Text('MSEB Hotmail'),

              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('https://media.9curry.com/uploads/organization/image/1917/cidco-logo.png') ,

                ),
                title: Text('1800-465431'),
                subtitle: Text('CIDCO Hotline'),

              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('https://media.9curry.com/uploads/organization/image/1917/cidco-logo.png') ,

                ),
                title: Text('cidco@gmail.com'),
                subtitle: Text('CIDCO Hotmail'),

              ),
            ),
          ],
        ),
      ),
    );

  }
}



