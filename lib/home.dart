import 'package:flutter/material.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/client_info.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('TAP OUT'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, new MaterialPageRoute(
                builder: (context) => const ClientInfoScreen()
            ));
          }, icon: const Icon(Icons.info)),
          FlatButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('logout'),
          onPressed:()async{
              await _auth.signOut();
          },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height*0.3,
            decoration: const BoxDecoration(
              image:DecorationImage(
                alignment: Alignment.topCenter,
              image: AssetImage('assets/images/head.png')
              ),
            )
          )
          ,SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height:64 ,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('  Name',style: TextStyle(color: Colors.white, fontSize: 20),),
                          Text('  Id123445',style: TextStyle(color: Colors.white, fontSize: 14),)
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Ink.image(image: const AssetImage('assets/images/dashboard.png'), height: 100,),
                              const Text('Dashboard')
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Ink.image(image: const AssetImage('assets/images/complaint.png'), height: 100,),
                              const Text('Complaint Registration')
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Ink.image(image: const  AssetImage('assets/images/feedback.png'), height: 100,),
                              const Text('Feedback')
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Ink.image(image: const NetworkImage('https://cdn-icons-png.flaticon.com/512/564/564619.png'), height: 100,),
                              const Text('Emergency')
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Ink.image(image: const NetworkImage('https://cdn-icons-png.flaticon.com/512/684/684908.png'), height: 100,),
                              Text('Location')
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Ink.image(image: const AssetImage('assets/images/contact.png'), height: 100,),
                              Text('Contact Us')
                            ],
                          ),
                        ),

                      ],
                      ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
