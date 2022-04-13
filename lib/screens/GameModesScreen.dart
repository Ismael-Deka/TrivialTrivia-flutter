import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class GameModesScreen extends StatelessWidget{
  const GameModesScreen({Key? key}) : super(key: key);


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
                  image: AssetImage("assets/Background4.png"),
                  fit: BoxFit.fill,
                ),
              ),

              ),
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
                            onPressed: () => Navigator.pushNamed(context, '/starting'),
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
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/profile'),
                        child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(162, 227, 255, 1),
                        ),
                        child: Center(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/Ellipse 425.png'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        )),
                      )  
                        ],
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/shadow_gem.png"),
                        fit: BoxFit.cover,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:60.0, bottom: 40.0, left: 40.0, right: 40.0),
                child:SafeArea(
                  child: Column(
                
                    children:  [
                
                      DecoratedBox(
                          decoration: BoxDecoration(
                
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFA2E3FF).withOpacity(0.80),
                                    Color(0xFFA2E3FF).withOpacity(0.55),
                                    Color(0xFFA2E3FF).withOpacity(0.28)
                                    //add more colors
                                  ]),
                              borderRadius: BorderRadius.circular(18.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.10), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]
                          ),
                          child:ElevatedButton(
                            style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                
                            onPressed: () => Navigator.pushNamed(context, '/trivia'),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 30.0),
                              child:
                              Text(
                                "Daily Challenge",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0
                                ),
                              ),
                            ),
                          )
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DecoratedBox(
                              decoration: BoxDecoration(
                
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA2E3FF).withOpacity(0.80),
                                        Color(0xFFA2E3FF).withOpacity(0.55),
                                        Color(0xFFA2E3FF).withOpacity(0.28)
                                        //add more colors
                                      ]),
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.10), //shadow for button
                                        blurRadius: 5) //blur radius of shadow
                                  ]
                              ),
                              child:ElevatedButton(
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )
                                    )
                                ),
                
                                onPressed: () => Navigator.pushNamed(context, '/trivia'),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                                  child:Column(
                                    children: const [
                                      Text(
                                        "15",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0
                                        ),
                                      ),
                                      Text(
                                        "Questions",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(
                              width: 60.0
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA2E3FF).withOpacity(0.80),
                                        Color(0xFFA2E3FF).withOpacity(0.55),
                                        Color(0xFFA2E3FF).withOpacity(0.28)
                                        //add more colors
                                      ]),
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.10), //shadow for button
                                        blurRadius: 5) //blur radius of shadow
                                  ]
                              ),
                              child:ElevatedButton(
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )
                                    )
                                ),
                
                                onPressed: () => Navigator.pushNamed(context, '/trivia'),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                                  child:Column(
                                    children: const [
                                      Text(
                                        "25",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0
                                        ),
                                      ),
                                      Text(
                                        "Questions",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 140.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DecoratedBox(
                              decoration: BoxDecoration(
                
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA2E3FF).withOpacity(0.80),
                                        Color(0xFFA2E3FF).withOpacity(0.55),
                                        Color(0xFFA2E3FF).withOpacity(0.28)
                                        //add more colors
                                      ]),
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.10), //shadow for button
                                        blurRadius: 5) //blur radius of shadow
                                  ]
                              ),
                              child:ElevatedButton(
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )
                                    )
                                ),
                
                                onPressed: () => Navigator.pushNamed(context, '/trivia'),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                                  child:Column(
                                    children: const [
                                      Text(
                                        "50",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0
                                        ),
                                      ),
                                      Text(
                                        "Questions",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(
                              width: 60.0
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA2E3FF).withOpacity(0.80),
                                        Color(0xFFA2E3FF).withOpacity(0.55),
                                        Color(0xFFA2E3FF).withOpacity(0.28)
                                        //add more colors
                                      ]),
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.10), //shadow for button
                                        blurRadius: 5) //blur radius of shadow
                                  ]
                              ),
                              child:ElevatedButton(
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )
                                    )
                                ),
                
                                onPressed: () => Navigator.pushNamed(context, '/trivia'),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                                  child:Column(
                                    children: const [
                                      Text(
                                        "30 sec",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.0
                                        ),
                                      ),
                                      Text(
                                        "relay",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                
                        ],
                      ),
                      SizedBox(height: 40.0),
                      DecoratedBox(
                          decoration: BoxDecoration(
                
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFA2E3FF).withOpacity(0.80),
                                    Color(0xFFA2E3FF).withOpacity(0.55),
                                    Color(0xFFA2E3FF).withOpacity(0.28)
                                    //add more colors
                                  ]),
                              borderRadius: BorderRadius.circular(18.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.10), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]
                          ),
                          child:ElevatedButton(
                            style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                
                            onPressed: () => Navigator.pushNamed(context, '/customgame'),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(85.0, 20.0, 85.0, 20.0),
                              child:
                              Text(
                                "Custom Game",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0
                                ),
                              ),
                            ),
                          )
                      ),
                
                    ],
                  ),
                ),
              )


            ],
          )
    );
  }

}