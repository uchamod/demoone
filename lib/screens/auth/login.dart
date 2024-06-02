import 'package:demo/services/authservices.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //ref for the auth
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sing in"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.singInAnonymously();
                _auth.getUserId(result);
              },
              child: const Text("sing in anounmusly"))
        ],
      ),
    );
  }
}
