import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:trial/first.dart';
import 'package:trial/home.dart';

import 'models/user.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    //return  Authenticate screen(First) or Home
    if (user == null) {
      return const FirstScreen();
    } else {
      return  HomeScreen();
    }
  }
}