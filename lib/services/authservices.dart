import 'dart:async';

import 'package:demo/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      return getUserId(user);
    } catch (err) {
      // print(err.toString());
      return null;
    }
  }

  //register using email and password
  Future registerUsingEmailandPassword(String email, String password) async {
    try {
      //create a user with email and a password
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return getUserId(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sing in using using email and password
  Future singinUsingEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return getUserId(user);
    } catch (err) {
      return null;
    }
  }
  //sing in using gmail

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
