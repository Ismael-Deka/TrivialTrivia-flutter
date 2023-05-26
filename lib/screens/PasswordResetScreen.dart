import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var bottomPadding = mediaQueryData.padding.bottom;

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SafeArea(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.chevronLeft,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/signin'),
                              ),
                              Text('Back to Login',
                                  style: GoogleFonts.inter(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  ))
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 80,
                      child: Container(
                          width: 260,
                          height: 219,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/ForgotPasswordGem.png'),
                                fit: BoxFit.fitWidth),
                          ))),
                  Positioned(
                      top: 290,
                      left: 70,
                      child: Text('Forgot Password?',
                          style: GoogleFonts.inter(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ))),
                  Positioned(
                    top: 350,
                    left: 40,
                    child: Container(
                      height: 280,
                      width: 315,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 40),
                          SizedBox(
                            width: 276,
                            height: 100,
                            child: Text(
                                "No worries! Please enter your registered email address. We’ll send instructions to help you reset your password.",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(255, 255, 255, 1)
                                      .withOpacity(0.9),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          SizedBox(
                            height: 40,
                            width: 250,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  filled: true,
                                  hintText: "Email",
                                  hintStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  fillColor: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              resetPassword();
                            },
                            child: Container(
                                width: 149,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.5)),
                                child: Center(
                                  child: Text('Reset Password',
                                      style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          fontSize: 12)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  Future resetPassword() async {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      const snackBar = SnackBar(
        content: Text('Password reset email has been sent!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
