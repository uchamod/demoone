import 'package:demo/screens/auth/login.dart';
import 'package:demo/screens/auth/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignInPage = true;
//function to togol between sing in and register page
  void changePage() {
    setState(() {
      isSignInPage = !isSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignInPage == true) {
      return SignIn(
        pageSwift: changePage,
      );
    } else {
      return Register(
        pageSwift: changePage,
      );
    }
  }
}
