import 'dart:async';

import 'package:demo/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //firebase instance provide all the methods in firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get the userid from the given user
  UsreModel? getUserId(User? user) {
    return user != null ? UsreModel(user: user.uid) : null;
  }

//the stream to check the user auth changes
  Stream<UsreModel?> get user {
    return _auth.authStateChanges().map(getUserId);
  }
  //sign in anonymously

  Future singInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //register using email and password
  //sing in using using email and password
  //sing in using gmail

  //singout
  Future singOut() async {
    try {
      await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
