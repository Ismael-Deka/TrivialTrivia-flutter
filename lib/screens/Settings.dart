import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivial_trivia/services/auth.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Service service = Service();
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
                              icon: const FaIcon(FontAwesomeIcons.x,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Text('Settings',
                                style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ))
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Column(
                    children: [
                      Container(
                          width: size.width,
                          height: size.height * .10,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Account Settings",
                                  style: GoogleFonts.inter(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(width: size.width * .50),
                              IconButton(
                                icon: const FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                onPressed:() => Navigator.pushNamed(context, '/editprofile'),
                              ),
                            ],
                          )),
                      Container(
                          width: size.width,
                          height: size.height * .10,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Terms of Service",
                                  style: GoogleFonts.inter(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(width: size.width * .38),
                              IconButton(
                                icon: const FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                onPressed: () {},
                              ),
                            ],
                          )),
                      Container(
                          width: size.width,
                          height: size.height * .10,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Privacy Policy",
                                  style: GoogleFonts.inter(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(width: size.width * .38),
                              IconButton(
                                icon: const FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                onPressed: () {},
                              ),
                            ],
                          )),
                      
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: GestureDetector(
                          onTap:()async{
                            Service.signOut(context);
                          },
                          child: Text("Log Out",
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
