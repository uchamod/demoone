import 'package:demo/services/authservices.dart';
import 'package:demo/util/constant.dart';
import 'package:demo/widgets/formfield.dart';
import 'package:demo/widgets/sheardbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final Function pageSwift;
  const SignIn({super.key, required this.pageSwift});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //ref for the auth
  final AuthServices _auth = AuthServices();

  //form key
  final _formkey = GlobalKey<FormState>();
  //textcontrollers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcmainBlack,
      //appbar
      appBar: AppBar(
        backgroundColor: kcmainBlack,
        title: Text(
          "SING IN",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: kcmainWhite, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      //app body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //avatar
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/WhatsApp Image 2024-06-03 at 16.37.25_a76b3f02.jpg",
                    width: 150,
                  ),
                ),
              ),
              //sing in form
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
                      showText: false,
                      isValid: _validatePassword,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //text and icon link part
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t you have an account?",
                              style: GoogleFonts.poppins(
                                  color: kcmainWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            //go to the register page
                            GestureDetector(
                              onTap: () {
                                widget.pageSwift();
                              },
                              child: Text(
                                "Register now",
                                style: GoogleFonts.poppins(
                                    color: kcBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "OR",
                          style: GoogleFonts.poppins(
                              color: kcmainWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log in with",
                              style: GoogleFonts.poppins(
                                  color: kcmainWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            //sing in via google
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                "assets/icons8-google-48.png",
                                width: 30,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            dynamic result =
                                await _auth.singinUsingEmailandPassword(
                                    _emailController.text,
                                    _passwordController.text);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid email or password"),
                                ),
                              );
                            }
                          }
                        },
                        child: const coustomButton(title: "SING IN")),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          dynamic result = await _auth.singInAnonymously();
                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("can't accsept as a guest"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("accsept as a guest"),
                              ),
                            );
                          }
                        },
                        child: const coustomButton(title: "Log in as Guest")),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
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

    return null;
  }
}

//  ElevatedButton(
//             onPressed: () async {
//               dynamic result = await _auth.singInAnonymously();
//               _auth.getUserId(result);
//             },
//             child: const Text("sing in anounmusly"))
