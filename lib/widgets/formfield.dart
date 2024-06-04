import 'package:demo/util/constant.dart';
import 'package:flutter/material.dart';

class UserDataFormFeild extends StatefulWidget {
  final TextEditingController controller;
  final inputType;
  final inputAction;
  final bool showText;
  dynamic sufficxWidget;
  final String? Function(String?) isValid;
  UserDataFormFeild(
      {super.key,
      required this.controller,
      required this.inputType,
      required this.inputAction,
      required this.showText,
      required this.isValid,
      this.sufficxWidget});

  @override
  State<UserDataFormFeild> createState() => _UserDataFormFeildState();
}

class _UserDataFormFeildState extends State<UserDataFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      obscureText: widget.showText,
      validator: widget.isValid,
      cursorColor: kcmainWhite,
      decoration: InputDecoration(
        suffixIcon: widget.sufficxWidget,
        focusColor: kcmainWhite,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: kcmainWhite,
            width: 5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kcmainWhite, width: 1.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kcmainWhite),
        ),
      ),
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: kcmainWhite),
    );
  }
}
