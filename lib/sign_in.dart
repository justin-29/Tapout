import 'package:flutter/material.dart';

import 'package:trial/services/auth.dart';
import 'package:trial/first.dart';
import 'package:trial/shared/constants.dart';
import 'package:trial/shared/loading.dart';
class SignInScreen extends StatefulWidget {
  //const SignInScreen({Key? key, void Function() toggleView}) : super(key: key);

  final Function toggleView;
SignInScreen({required this.toggleView});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordHide = true;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String Email ='';
  String pass='';
  String error='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
        widget.toggleView();
        }, icon: const Icon(Icons.add_circle))],
      ),
      body: SingleChildScrollView(
        child:Form(

        key: _formKey,
        child: Column(

          children: [
            const SizedBox(height: 5.0),
            
            Ink.image(image: const AssetImage('assets/images/Logo.png'), height:200,),
            SizedBox(height: 45.0),
            // const Padding(
            //   padding: EdgeInsets.all(10),
            //   child: CircleAvatar(
            //     radius: 30,
            //     child: Icon(
            //       Icons.login,
            //     ),
            //   ),
            // ),
            
            ListTile(
              leading: const Icon(Icons.email),
              title: TextFormField(
                validator: (val)=>val!.isEmpty ? 'Enter a email':null ,
                controller: name,
                decoration:textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val){
                  setState(()=> Email=val);
                },
              ),
              trailing: IconButton(
                onPressed: () {
                  name.clear();
                },
                icon: const Icon(Icons.clear, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            ListTile(
              leading: const Icon(Icons.keyboard),
              title: TextFormField(
                validator: (val)=>val!.length<8? 'Enter a password 8+ chars long':null ,
                controller: password,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: passwordHide,
                onChanged: (val){
                  setState(() => pass=val);
                },
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordHide = !passwordHide;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: passwordHide ? Colors.black : Colors.blue,
                  )),
            ),
            const SizedBox(height: 20.0),
            TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide()))),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    setState(()=> loading =true);
                    dynamic result = await _auth.signInWithEmailAndPassword(Email, pass);
                    if(result==null){
                      setState(() {
                      error ='Could not sign in with those credentials';
                      loading= false;
                      });
                    }
                    else{
                      //1. fetch query snapshot form clients
                      //2. store in shared preferences

                    }
                  }
                },
                child: const Text('Submit'))
            ,const SizedBox(height: 12,)
            ,Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0)
            )
            ,TextButton(
                style: ButtonStyle(
                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(10),
                            side:  const BorderSide()
                        )
                    )
                ),
                onPressed: ()async{
                    setState(()=> loading =true);
                    dynamic result = await _auth.GuestLogin();

                    if (result == null){
                      setState(() {
                        error ='Could not log in guest';
                        loading= false;
                      });
                    print('error signing in');
                    }else{
                    print( 'Guest loggrd in');
                    print(result.uid);
                    }

                }
                , child: const Text('Guest Login'))
          ],
        ),
      ),
      )
    );
  }
}
