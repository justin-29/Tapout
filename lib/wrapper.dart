import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:trial/first.dart';
import 'package:trial/home.dart';
import 'package:trial/select.dart';

import 'admin_home.dart';
import 'models/user.dart';

final AdminList =['8L8iPtkwvUhXwY4GCBCZDUULQVD3','uGRECqlPKqfYWGpk8MPLXhtfAEI2'];
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    //return  Authenticate screen(First) or Home
    if (user == null) {
      return const FirstScreen();
    } else {
      if (AdminList.contains(user.uid)) {
        return  const AdminHome();
      }else{
        return HomeScreen();//HomeScreen(uid: user!.uid).userData;
      }
    }
  }
}