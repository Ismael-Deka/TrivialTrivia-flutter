
import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivial_trivia/services/auth.dart';

class Leaderboard extends HookWidget {

  List<List<String>> playerLeaderboard = List.empty(growable: true);
  late List<ValueNotifier> userNameList;
  late List<ValueNotifier> pointList;

  Service service = Service();

  Leaderboard({Key? key}) : super(key: key);
  void loadLeaderboard() async{
    playerLeaderboard = await service.getLeaderboard();
    for(int i = 0; i < playerLeaderboard.length; i++){
      userNameList[i].value = playerLeaderboard[i][0];
      pointList[i].value = playerLeaderboard[i][1];
    }
  }
  @override
  Widget build(BuildContext context) {

    userNameList = List.generate(20, (index) => useState(""));
    pointList = List.generate(20, (index) => useState(""));

    loadLeaderboard();

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

                    Padding(
                      padding: EdgeInsets.only(top: size.height*0.35,),
                      child:  Column(
                        children: [
                          Container(
                              width: 303,
                              height: 200,

                              child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        top: 24,
                                        left: 106,
                                        child: Container(
                                            width: 85,
                                            height: 85,
                                            decoration: BoxDecoration(
                                              color : Color.fromRGBO(222, 245, 255, 1),
                                              borderRadius : BorderRadius.all(Radius.elliptical(85, 85)),
                                            )
                                        )
                                    ),Positioned(
                                        top: 76,
                                        left: 220,
                                        child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color : Color.fromRGBO(222, 245, 255, 1),
                                              borderRadius : BorderRadius.all(Radius.elliptical(80, 80)),
                                            )
                                        )
                                    ),Positioned(
                                        top: 76,
                                        left: 5,
                                        child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color : Color.fromRGBO(222, 245, 255, 1),
                                              borderRadius : BorderRadius.all(Radius.elliptical(80, 80)),
                                            )
                                        )
                                    ),Positioned(
                                        top: 29,
                                        left: 111,
                                        child: Container(
                                            width: 75,
                                            height: 75,
                                            decoration: const BoxDecoration(
                                              image : DecorationImage(
                                                  image: AssetImage('assets/pfp.png'),
                                                  fit: BoxFit.fitWidth
                                              ),
                                              borderRadius : BorderRadius.all(Radius.elliptical(75, 75)),
                                            )
                                        )
                                    ),Positioned(
                                        top: 81,
                                        left: 10,
                                        child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: const BoxDecoration(
                                              image : DecorationImage(
                                                  image: AssetImage('assets/pfp.png'),
                                                  fit: BoxFit.fitWidth
                                              ),
                                              borderRadius : BorderRadius.all(Radius.elliptical(70, 70)),
                                            )
                                        )
                                    ),Positioned(
                                        top: 81,
                                        left: 225,
                                        child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: const BoxDecoration(
                                              image : DecorationImage(
                                                  image: AssetImage('assets/pfp.png'),
                                                  fit: BoxFit.fitWidth
                                              ),
                                              borderRadius : BorderRadius.all(Radius.elliptical(70, 70)),
                                            )
                                        )
                                    ),const Positioned(
                                        top: 0,
                                        left: 141,
                                        child: Text('1', textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),const Positioned(
                                        top: 53,
                                        left: 37,
                                        child: Text('2', textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),const Positioned(
                                        top: 52,
                                        left: 254,
                                        child: Text('3', textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),Positioned(
                                        top: 117,
                                        left: 130,
                                        child: Text(userNameList[0].value, textAlign: TextAlign.center, style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),Positioned(
                                        top: 138,
                                        left: 130,
                                        child: Text(pointList[0].value + ' pts', textAlign: TextAlign.center, style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ), Positioned(
                                        top: 182,
                                        left: 20,
                                        child: Text(pointList[1].value+' pts', textAlign: TextAlign.center, style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),Positioned(
                                        top: 182,
                                        left: 242,
                                        child: Text(pointList[2].value+' pts', textAlign: TextAlign.center, style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),Positioned(
                                        top: 164,
                                        left: 242,
                                        child: Text(userNameList[2].value, textAlign: TextAlign.center, style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),Positioned(
                                        top: 164,
                                        left: 20,
                                        child: Text(userNameList[1].value, textAlign: TextAlign.center, style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:size.width*0.12),
                            child: Container(
                                width: size.width,
                                height: size.height-((size.height*0.35)+200),

                                child:ListView(
                                  children: List.generate(playerLeaderboard.length, (index) =>
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                (index+1).toString(),
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20.0,
                                                    color: Colors.white

                                                ),
                                              ),
                                              SizedBox(
                                                  width:5.0
                                              ),
                                              Container(
                                                  width: 290,
                                                  height: 55,
                                                  decoration: const BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(30),
                                                      topRight: Radius.circular(30),
                                                      bottomLeft: Radius.circular(30),
                                                      bottomRight: Radius.circular(30),
                                                    ),
                                                    gradient : LinearGradient(
                                                        begin: Alignment(0.8763561844825745,0.05382949486374855),
                                                        end: Alignment(-0.05382949486374855,0.03152172639966011),
                                                        colors: [Color.fromRGBO(161, 226, 255, 1),Color.fromRGBO(222, 245, 255, 1)]
                                                    ),
                                                  ),
                                                  child:Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Container(
                                                          width: 50,
                                                          height: 47,
                                                          decoration: const BoxDecoration(
                                                            image : DecorationImage(
                                                                image: AssetImage('assets/pfp.png'),
                                                                fit: BoxFit.fitWidth
                                                            ),
                                                            borderRadius : BorderRadius.all(Radius.elliptical(50, 47)),
                                                          )
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        userNameList[index].value,
                                                        style: const TextStyle(
                                                            fontSize: 10.0,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: "Inter",
                                                            color: Colors.grey
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),

                                                      Text(
                                                        pointList[index].value+" points",
                                                        textDirection: TextDirection.rtl,
                                                        style: const TextStyle(
                                                            fontSize: 10.0,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: "Inter",
                                                            color: Colors.grey
                                                        ),
                                                      )

                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          )
                                        ],
                                      )

                                  ),
                                )       // Figma Flutter Generator Rectangle914Widget - RECTANGLE



                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )));
  }


}




