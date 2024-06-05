import 'package:demo/services/authservices.dart';
import 'package:flutter/material.dart';

class GoogleSing {
  final AuthServices _auth = AuthServices();

  Future<void> authenticateWithGoogle({required BuildContext context}) async {
    try {
      await _auth.signInWithGoogle();
    } catch (err) {
      if (!context.mounted) return;
      print(err.toString());
    }
  }
}
