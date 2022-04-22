import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    var bottomPadding = mediaQueryData.padding.bottom;

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background.png"),
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
                              onPressed: () => Navigator.pop(context),
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.05,
                        color: Colors.transparent,
                        child: Center(
                          child: Text("Leaderboard",
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.40,
                        color: Colors.transparent,
                        child: Center(
                          child: Container(
                            width: size.width,
                            height: size.height * 0.40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/Group 1397.png'),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                      ),
                    ),
                    WinnerContainer(),
                  ],
                )
              ],
            )));
  }
}

class WinnerContainer extends StatelessWidget {
  const WinnerContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    var bottomPadding = mediaQueryData.padding.bottom;
    return Stack(
      children: [
              Padding(
                padding: const EdgeInsets.only(top: 250, left:10),
                child: Container(
                          width: size.width,
                          height: size.height * 0.20,
                          color: Colors.transparent,
                          child: Center(
                            child: Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(162, 227, 255, 1)
                                      .withOpacity(.80),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage('assets/pfp.png'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )),
                          ),
                        ),
              ),
      ],
    );
  }
}
