import 'package:flutter/material.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/shared/constants.dart';
import 'package:trial/shared/loading.dart';

class RegistrationScreen extends StatefulWidget {
  //const RegistrationScreen({Key? key, void Function() toggleView}) : super(key: key);

final Function toggleView;
RegistrationScreen({required this.toggleView});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  //String username ='';
  String Email='';
  String pass='';
  String error='';

  bool passwordHide = true;
  int monthCount = 0;
  List<bool> checkBoxValues = [false, false, false, false];
  Row checkBoxElement(String value, int index) {
    return Row(
      children: [
        Checkbox(
          value: checkBoxValues[index],
          onChanged: (value) {},
        ),
        Padding(
            padding: const EdgeInsets.all(5),
            child: Text(value)
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    password.addListener(() {
      if (password.text.contains(RegExp(r'[A-Z]'))) {
        setState(() {
          checkBoxValues[0] = true;
        });

      } if (!password.text.contains(RegExp(r'[A-Z]'))) {
        setState(() {
          checkBoxValues[0] = false;
        });
      } if (password.text.contains(RegExp(r'[0-9]'))) {
        setState(() {
          checkBoxValues[1] = true;
        });

      } if (!password.text.contains(RegExp(r'[0-9]'))) {
        setState(() {
          checkBoxValues[1] = false;
        });

      }
      if(password.text.length>=8){
        setState(() {
          checkBoxValues[2]=true;
        });
      }
      if(password.text.length<8){
        setState(() {
          checkBoxValues[2]=false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading () : Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Registration- Sign Up'),
        centerTitle: true,

        actions: [IconButton(onPressed: () {
          widget.toggleView();
        }, icon: const Icon(Icons.person))],

      ),
      body: SingleChildScrollView(
        child: Form(
        key: _formKey,

        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.edit,

                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: TextFormField(
                keyboardType: TextInputType.text,
                //validator: (val)=>val!.isEmpty ? 'Enter a username':null ,
                controller: name,
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (val){
                  //setState(()=> username=val);
                },
              ),
              trailing: IconButton(
                onPressed: () {
                  name.clear();
                },
                icon: const Icon(
                    Icons.clear,
                    color : Colors.black
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: TextFormField(
                validator: (val)=>val!.isEmpty ? 'Enter a email':null ,
                controller: email,
                decoration:  textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val){
                  setState(()=> Email=val);
                },
              ),
              trailing: IconButton(
                onPressed: () {
                  email.clear();
                },
                icon: const Icon(
                    Icons.clear,
                    color : Colors.black
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
                icon: const Icon(
                    Icons.clear,
                    color : Colors.black
                ),
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
                icon: const Icon(
                    Icons.clear,
                    color : Colors.black
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.keyboard),
              title: TextFormField(
                validator: (val)=>val!.length<8? 'Enter a password 8+ chars long':null ,
                controller: password,
                decoration:textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: passwordHide,
                onChanged: (val){
                  setState(() => pass=val);
                },
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordHide=!passwordHide;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: passwordHide? Colors.black:Colors.blue,
                  )),
            ),
            checkBoxElement('Minimum one UpperCase', 0),
            checkBoxElement('Minimum one number', 1),
            checkBoxElement('Minimum eight characters', 2),


            TextButton(
                style: ButtonStyle(
                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(10),
                            side:  const BorderSide()
                        )
                    )
                ),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    setState(()=> loading =true);
                    dynamic result = await _auth.registerWithEmailAndPassword(Email,pass);
                    if(result==null){
                      setState(() {
                        error = 'please enter a valid email';
                        loading = false;
                      });
                    }
                  }
                }
                , child: const Text('Submit'))
            ,const SizedBox(height: 12,)
            ,Text(
              error,
              style: const TextStyle(color: Colors.red, fontSize: 14.0)
            )
            /*,TextButton(
                style: ButtonStyle(
                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(10),
                            side:  const BorderSide()
                        )
                    )
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/guest_login');
            }
                , child: const Text('Guest Login'))*/
          ],

        ),
      ),
      )
    );
  }
}
