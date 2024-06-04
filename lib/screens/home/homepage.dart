import 'package:demo/services/authservices.dart';
import 'package:demo/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: kcmainBlack,
      appBar: AppBar(
        backgroundColor: kcmainWhite,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(BorderSide.strokeAlignCenter),
              backgroundColor: WidgetStatePropertyAll(
                kcmainWhite,
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
            Center(
              child: Text(
                "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: kcmainWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              "Powerd by  @ChamodUdara",
              style: GoogleFonts.poppins(
                  color: kcmainWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }
}
