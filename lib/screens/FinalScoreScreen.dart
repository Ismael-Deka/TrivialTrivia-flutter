import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FinalScore extends StatelessWidget {

  const FinalScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    var bottomPadding = mediaQueryData.padding.bottom;
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    var totalCorrect = arguments['numCorrect'];
    var numQuestions = arguments['total'];
    var averageTime =  arguments['time_completed']==null?"":"Time Completed: "+arguments['time_completed'] ;
    var pointsGained = "+" + arguments['points_gained'].toString();




    return Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background3.png"),
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
                      SizedBox(
                        width: size.width * 0.83,
                      ),
                    ],
                  )),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 10),
                child: Container(
                    width: 482,
                    height: size.height*0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo_small.png'),
                          fit: BoxFit.fitWidth),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text("Final Score",
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w700)),
              ),
              //Need to update and add setState
              //just placement for UI
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.19,
                    color: Colors.transparent,
                    child: Center(
                        child: Container(
                          width: size.width * 0.85,
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(249, 240, 240, 1)
                                .withOpacity(.80),
                          ),
                          child: Center(
                            //update current rank
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  Text("You got $totalCorrect questions correct out of $numQuestions",
                                      style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(150, 134, 134, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(averageTime,
                                      style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(150, 134, 134, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                  Text("Points gained: $pointsGained",
                                      style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(150, 134, 134, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                ],
                              )),
                        )),
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                child: GestureDetector(
                  onTap: (){
                    if(Navigator.canPop(context)){
                      Navigator.pop(context);
                    }
                    Navigator.pushNamed(context, '/main');
                    },
                  child: Container(
                      width: 221,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(134, 201, 231, 1),
                      ),
                      child: Center(
                        child: Text('Play Again',
                            style: GoogleFonts.inter(
                                color: const Color.fromRGBO(248, 239, 239, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/leaderboard'),
                  child: Container(
                      width: 221,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(134, 201, 231, 1),
                      ),
                      child: Center(
                        child: Text('Leaderboard',
                            style: GoogleFonts.inter(
                                color: const Color.fromRGBO(248, 239, 239, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      )),
                ),
              ),

            ],
          ),

        ]));
  }
}

