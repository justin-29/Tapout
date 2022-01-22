import 'package:firebase_auth/firebase_auth.dart';
import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



//create user obj based on FirebaseUser
  Users? _userFromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    } else {
      return Users(uid: user.uid);
    }
  }

  //auth change user stream
  @override
  Stream<Users?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    //.map((User? user)=>_userFromFirebaseUser(user));


  }

  // guest sign in
  Future GuestLogin() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email&pass
  Future  signInWithEmailAndPassword(String Email, String pass) async {
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: Email, password: pass);
      User? user= result.user;


      //await DatabaseService(uid: user!.uid).updateUserData('username','phone', 'loc', 'Email');
      return _userFromFirebaseUser(user);
    }catch (e){
      print(e.toString());
      return null;
    }
  }
//register with email&pass
  Future  registerWithEmailAndPassword(String Email, String pass) async {
    try{
    UserCredential result= await _auth.createUserWithEmailAndPassword(email: Email, password: pass);
    User? user= result.user;

    //create a new document for the user with the uid
    await DatabaseService(uid: user!.uid).updateUserData('username','phone', 'loc', 'Email');
    return _userFromFirebaseUser(user);
    }catch (e){
      print(e.toString());
      return null;
      }
  }
//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
