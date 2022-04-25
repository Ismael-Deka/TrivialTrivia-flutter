import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_trivia/screens/GameModesScreen.dart';
import 'package:trivial_trivia/screens/StartingScreen.dart';
import 'package:trivial_trivia/services/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  //hello
  void navigateToStartingScreen(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => {
          if(Service.isUserLoggedIn()){
            Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => GameModesScreen()))
        }else{
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => StartingScreen()))
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    navigateToStartingScreen(context);
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/SplashScreen.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/Group 1201.png"),
              fit: BoxFit.cover,
            )
          ],
        ),
      ],
    );
  }
}
