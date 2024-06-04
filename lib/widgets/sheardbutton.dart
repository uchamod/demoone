import 'package:demo/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class coustomButton extends StatefulWidget {
  final String title;
  const coustomButton({super.key, required this.title});

  @override
  State<coustomButton> createState() => _coustomButtonState();
}

class _coustomButtonState extends State<coustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: kcGrey,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: kcmainWhite, width: 2),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.poppins(
                color: kcmainWhite, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
