import 'dart:typed_data';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivial_trivia/screens/SignInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivial_trivia/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivial_trivia/services/utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Uint8List? _image;

  Service service = Service();

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    var bottomPadding = mediaQueryData.padding.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(children: <Widget>[
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
                            Text('Back',
                                style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ))
                          ],
                        )),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height / 8,
                    ),
                    Align(
                        alignment: const Alignment(-0.60, -0.60),
                        child: Text('Welcome',
                            style: GoogleFonts.inter(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(bottom: bottomPadding),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: const Alignment(0, 0.37),
                              child: ClipRect(
                                  child: Container(
                                      height: 480,
                                      width: 315,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Stack(
                                        children: <Widget>[
                                          Align(
                                            alignment:
                                                const Alignment(0, -0.90),
                                            child: Text('Sign Up',
                                                style: GoogleFonts.inter(
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic,
                                                )),
                                          ),
                                          Align(
                                            alignment:
                                                const Alignment(0, -0.75),
                                            child: Container(
                                              width: size.width,
                                              height: size.height * 0.20,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Container(
                                                    width: 90,
                                                    height: 90,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color.fromRGBO(
                                                          162, 227, 255, 1),
                                                    ),
                                                    child: Center(
                                                        child: _image != null
                                                            ? CircleAvatar(
                                                                radius: 38,
                                                                backgroundImage:
                                                                    MemoryImage(
                                                                        _image!),
                                                              )
                                                            : const CircleAvatar(
                                                                radius: 38,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        'assets/Ellipse 425.png'),
                                                              ))),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const Alignment(0.25, -0.40),
                                            child: IconButton(
                                                onPressed: selectImage,
                                                icon: const Icon(
                                                    Icons.add_a_photo,
                                                    color: Color.fromARGB(
                                                        255, 66, 66, 66))),
                                          ),
                                          Align(
                                              alignment:
                                                  const Alignment(0, -0.20),
                                              child: SizedBox(
                                                height: 40,
                                                width: 250,
                                                child: TextField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 15,
                                                              right: 15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      filled: true,
                                                      hintText: "Email",
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 13,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      1)),
                                                      fillColor: Colors.white
                                                          .withOpacity(0.5)),
                                                ),
                                              )),
                                          Align(
                                            alignment: const Alignment(0, 0.07),
                                            child: SizedBox(
                                              height: 40,
                                              width: 250,
                                              child: TextField(
                                                controller: emailController,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    filled: true,
                                                    hintText: "Email",
                                                    hintStyle: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1)),
                                                    fillColor: Colors.white
                                                        .withOpacity(0.5)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(0, 0.35),
                                            child: SizedBox(
                                              height: 40,
                                              width: 250,
                                              child: TextField(
                                                controller: passwordController,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    filled: true,
                                                    hintText: "Password",
                                                    hintStyle: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1)),
                                                    fillColor: Colors.white
                                                        .withOpacity(0.5)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                              alignment:
                                                  const Alignment(-0.30, 0.50),
                                              child: Text(
                                                  'Your password must be 6-72 characters',
                                                  style: GoogleFonts.inter(
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ))),
                                          Align(
                                              alignment:
                                                  const Alignment(0, 0.80),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  String res = await Service()
                                                      .registerUser(
                                                          context,
                                                          email: emailController
                                                              .text,
                                                          username:
                                                              usernameController
                                                                  .text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                          file: _image!);
                                                },
                                                child: Container(
                                                    width: 140,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                    child: Center(
                                                      child: Text('Register',
                                                          style: GoogleFonts.inter(
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  1),
                                                              fontSize: 15)),
                                                    )),
                                              ))
                                        ],
                                      ))))
                        ],
                      ),
                    )
                  ],
                )
              ]),
            )));
  }
}
