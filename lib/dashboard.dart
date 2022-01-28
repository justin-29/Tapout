import 'package:flutter/material.dart';
import 'package:trial/location.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/client_info.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tapout'),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _firstWidget(),
              SizedBox(height: 15),
              _secondWidget(),
            ],
          )),
    );
  }

  Widget _firstWidget() {
    return InkWell(
        onTap: () {},
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 55,
                    width: 30,
                    decoration: myBoxDecoration(),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Ongoing Outages',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
  }

  Widget _secondWidget() {
    return InkWell(
        onTap: () {},
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: myBoxDecoration(),
                    height: 55,
                    width: 30,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Scheduled Outages',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
          ),
    );
  }
}
