import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivial_trivia/services/auth.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  Future<bool> isInternetAvailable() async { //TODO - check for internet connection
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background3.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Stack(
            children: [
              const Image(
                image: AssetImage("assets/Logo.png"),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height/15),
                        child:
                        Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/main'),
                                child: Container(
                                    width: 207,
                                    height: 39,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(72, 194, 242, 1).withOpacity(.80),
                                    ),
                                    child: Center(
                                      child: Text('Continue as guest',
                                          style: GoogleFonts.inter(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/signin'),
                                child: Container(
                                    width: 207,
                                    height: 39,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(72, 194, 242, 1).withOpacity(.80),
                                    ),
                                    child: Center(
                                      child: Text('Sign In',
                                          style: GoogleFonts.inter(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/registration'),
                                child: Container(
                                    width: 207,
                                    height: 39,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(72, 194, 242, 1).withOpacity(.80),
                                    ),
                                    child: Center(
                                      child: Text('Create an account',
                                          style: GoogleFonts.inter(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                    )),
                              ),
                            ],
                      )

                      )
                    ],
                  )
                ],
              )

            ],
          ),
          Visibility(
            visible: false,
            child: AlertDialog(
              title: const Text('Internet Connection Required'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Please check your Internet connection before continuing.'),
                  ],
                ),
              ),actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {

                      },
                    ),
                  ],
                )
            ],
            ),

          )
        ],
      ),
    );
  }
}
