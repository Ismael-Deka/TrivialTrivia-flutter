import 'dart:ui';

import 'package:flutter/material.dart';


class GameModesScreen extends StatelessWidget{
  const GameModesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Trivial Trivia"),
        ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
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
                padding: const EdgeInsets.all(40.0),
                child:Column(

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
                    SizedBox(height: 30.0),
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

                          onPressed: (){},
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
              )


            ],
          )
    );
  }

}