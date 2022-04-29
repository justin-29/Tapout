import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String title = 'About Us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/tower2.png"),
          fit: BoxFit.cover,
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpandableText(
                  "About Tapout",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                  collapseText: 'Show less',
                  expandText: 'Show more',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpandableText(
                  "The main aim of this app is to provide a user-friendly UI for spreading awareness about problems and outages regarding water and electricity to give chance to the user to prepare for them in advance, so they aren’t caught in a bad position. The anxious customers can register their complaints and inquiries to authorities  . The aim of the app is to create a useful information network and connect the authorities to users efficiently",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                  collapseText: 'Show less',
                  expandText: 'Show more',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
