import 'package:demo/models/usermodel.dart';
import 'package:demo/screens/auth/authentication.dart';
import 'package:demo/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //get the userdata that catch from stream and that data can be usermodel(uid) type data or null
    final userData = Provider.of<UsreModel?>(context);
    //check userdata and take into the rigth page
    if (userData == null) {
      return const Authenticate();
    } else {
      return const HomePage();
    }
  }
}
