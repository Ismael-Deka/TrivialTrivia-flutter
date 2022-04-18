import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomGame extends HookWidget {

  late List<ValueNotifier> selectedDifficultyStateList;

  int selectedDifficultyIndex = -1;

  CustomGame({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    var bottomPadding = mediaQueryData.padding.bottom;

    selectedDifficultyStateList = List.generate(3, (index) => useState(const Color.fromRGBO(248, 239, 239, 1)));

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Background3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
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
                                Navigator.pushNamed(context, '/main'),
                          ),
                          Text('Back',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              )),
                        ],
                      )),
                ),
              ),
              Positioned(
                  top: 130,
                  left: 75,
                  child: Text('Custom Game',
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ))),
              Positioned(
                  top: 200,
                  child: Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(162, 227, 255, 1)
                              .withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: bottomPadding),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: 40,
                              child: Text("Difficulty",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Positioned(
                              top: 70,
                              left: 40,
                              child: Container(
                                  width: 308.01,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: selectedDifficultyStateList[0].value),
                                  child: Center(
                                    child: Text('Easy',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  )),
                            ),
                            Positioned(
                              top: 130,
                              left: 40,
                              child: Container(
                                  width: 308.01,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: selectedDifficultyStateList[1].value),
                                  child: Center(
                                    child: Text('Medium',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  )),
                            ),
                            Positioned(
                              top: 190,
                              left: 40,
                              child: Container(
                                  width: 308.01,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: selectedDifficultyStateList[2].value),
                                  child: Center(
                                    child: Text('Hard',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  )),
                            ),
                            Positioned(
                              top: 250,
                              left: 40,
                              child: Text("Number of Questions",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Positioned(
                              top: 285,
                              left: 40,
                              child: Container(
                                  width: 166,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color.fromRGBO(
                                          248, 239, 239, 1)),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 12),
                                      IconButton(
                                        icon: const FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005)),
                                        onPressed: () {},
                                      ),
                                      const SizedBox(width: 15),
                                      Text("5",
                                          style: GoogleFonts.inter(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.6700000166893005),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(width: 17),
                                      IconButton(
                                        icon: const FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  )),
                            ),
                            Positioned(
                              top: 340,
                              left: 40,
                              child: Text("Timer",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Positioned(
                                top: 375,
                                left: 40,
                                child: Row(children: [
                                  Container(
                                      width: 97,
                                      height: 86,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Alarm.png')),
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: const Color.fromRGBO(
                                              248, 239, 239, 1))),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 97,
                                      height: 86,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Close_SM.png')),
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: const Color.fromRGBO(
                                              248, 239, 239, 1)))
                                ])),
                            Positioned(
                              top: 500,
                              left: 85,
                              child: Container(
                                  width: 221,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color.fromRGBO(
                                          248, 239, 239, 1)),
                                  child: Center(
                                    child: Text('START',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                  )),
                            )
                          ],
                        ),
                      )))
            ],
          )),
    );
  }
}

