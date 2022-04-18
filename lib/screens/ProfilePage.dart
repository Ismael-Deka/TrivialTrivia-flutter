import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    //var bottomPadding = mediaQueryData.padding.bottom;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Background4.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
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
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text('Back',
                        style: GoogleFonts.inter(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        )),
                    SizedBox(
                      width: size.width * 0.63,
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.gear,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      onPressed: () => Navigator.pushNamed(context, '/settings'),
                    ),
                  ],
                )),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                width: size.width,
                height: size.height * 0.20,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                      width: 153,
                      height: 153,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(162, 227, 255, 1),
                      ),
                      child: Center(
                        child: Container(
                          width: 132.79,
                          height: 132.79,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/Ellipse 425.png'),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                  width: size.width,
                  height: size.height * 0.05,
                  color: Colors.transparent,
                  child: Center(
                      //update username to current user's username
                      child: Text("eucalypjess",
                          style: GoogleFonts.inter(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          )))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                  width: size.width,
                  height: size.height * 0.13,
                  color: Colors.transparent,
                  child: Center(
                      child: Container(
                          width: size.width * 0.70,
                          height: size.height * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(134, 201, 231, 1)
                                .withOpacity(.80),
                          ),
                          child: Column(
                            //update number of following and followers
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Container(
                                  width: size.width * 0.70,
                                  height: size.height * 0.03,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("0",
                                          style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      SizedBox(width: size.width * 0.25),
                                      Text("0",
                                          style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.70,
                                height: size.height * 0.03,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Following",
                                        style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(width: size.width * 0.15),
                                    Text("Followers",
                                        style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: size.width,
                  height: size.height * 0.19,
                  color: Colors.transparent,
                  child: Center(
                      child: Container(
                    width: size.width * 0.85,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(249, 240, 240, 1)
                          .withOpacity(.80),
                    ),
                    child: Center(
                        //update current rank
                        child: Text('Current Rank: #325',
                            style: GoogleFonts.inter(
                              color: const Color.fromRGBO(150, 134, 134, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ))),
                  )),
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: size.width,
                  height: size.height * 0.19,
                  color: Colors.transparent,
                  child: Center(
                      child: Container(
                          width: size.width * 0.85,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(249, 240, 240, 1)
                                .withOpacity(.80),
                          ),
                          child: Center(
                            child: Container(
                                width: size.width * 0.85,
                                height: size.height * 0.10,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width * 0.20,
                                      height: size.height * 0.10,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/Group 1204.png"),
                                        ),
                                      ),
                                    ),
                                    //update total points
                                    Text('0 pts',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                150, 134, 134, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )),
                          ))),
                )),
          ],
        )
      ]),
    ));
  }
}
