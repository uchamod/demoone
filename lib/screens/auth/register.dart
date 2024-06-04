import 'package:demo/services/authservices.dart';
import 'package:demo/util/constant.dart';
import 'package:demo/widgets/formfield.dart';
import 'package:demo/widgets/sheardbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final Function pageSwift;
  const Register({super.key, required this.pageSwift});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //create a object for authservicse
  final AuthServices _auth = AuthServices();
  //form key
  final _formkey = GlobalKey<FormState>();
  //textcontrollers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isvisible = true;
  bool _isvisibleCorrect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcmainBlack,
      appBar: AppBar(
        backgroundColor: kcmainBlack,
        title: Text(
          "REGISTER",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: kcmainWhite, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/WhatsApp Image 2024-06-03 at 16.37.25_a76b3f02.jpg",
                    width: 150,
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          color: kcmainWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    UserDataFormFeild(
                      controller: _emailController,
                      showText: false,
                      isValid: _validateEmail,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                          color: kcmainWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    UserDataFormFeild(
                      controller: _passwordController,
                      showText: _isvisible,
                      isValid: _validatePassword,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      sufficxWidget: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordShow();
                          });
                        },
                        child: _isvisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.poppins(
                          color: kcmainWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    UserDataFormFeild(
                      controller: _confirmPasswordController,
                      showText: _isvisibleCorrect,
                      isValid: _validatePassword,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      sufficxWidget: InkWell(
                        onTap: () {
                          setState(() {
                            isConformPasswordShow();
                          });
                        },
                        child: _isvisibleCorrect
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //text link part
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.poppins(
                                  color: kcmainWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            //go to register page
                            GestureDetector(
                              onTap: () {
                                widget.pageSwift();
                              },
                              child: Text(
                                "Sing In",
                                style: GoogleFonts.poppins(
                                    color: kcBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    //register button
                    GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            dynamic result =
                                await _auth.registerUsingEmailandPassword(
                                    _emailController.text,
                                    _passwordController.text);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("something went wrong"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("data is saved"),
                                ),
                              );
                            }
                          }
                        },
                        child: const coustomButton(title: "REGISTER")),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regex for validating email format
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  //check password is valid
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return "psaawords are doesn't match";
    }

    return null;
  }

  //controll the visibility of password
  void isPasswordShow() {
    _isvisible = !_isvisible;
  }

  void isConformPasswordShow() {
    _isvisibleCorrect = !_isvisibleCorrect;
  }
}
