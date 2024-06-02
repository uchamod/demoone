import 'package:demo/services/authservices.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create a authservice object
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 173, 243),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(BorderSide.strokeAlignCenter),
              backgroundColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 89, 173, 243),
              ),
            ),
            onPressed: () async {
              await _auth.singOut();
            },
            child: const Icon(
              Icons.logout_sharp,
              size: 28,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              child: const Center(child: Text("flutter homepage")),
            )
          ],
        ),
      ),
    );
  }
}
