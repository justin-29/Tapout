import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first.dart';


class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Select '),
        centerTitle: true,
      ),
      body: //Expanded(child:
      GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          crossAxisCount: 1,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const FirstScreen()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink.image(
                      image: const NetworkImage(
                          'https://play-lh.googleusercontent.com/BoQUq1FnM3HcgRFyfl8vj45aof-waeGdcX9rgZOGkD4ToGXUIG1KnTQOGNurrSlUpx0'),
                      height: 100,
                    ),
                    const Text('Electricity')
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const FirstScreen())
                );
              },
              child:
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink.image(
                      image: const NetworkImage(
                          'https://media.9curry.com/uploads/organization/image/1917/cidco-logo.png'),
                      height: 100,
                    ),
                    const Text('Water')
                  ],
                ),
              ),
            ),
          ],
        //),
      ),
    );
  }
}