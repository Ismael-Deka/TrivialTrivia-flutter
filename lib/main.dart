import 'package:flutter/material.dart';
import 'package:trivial_trivia/screens/GameModesScreen.dart';
import 'package:trivial_trivia/screens/StartingScreen.dart';
import 'package:trivial_trivia/screens/SplashScreen.dart';
import 'package:trivial_trivia/screens/TriviaQuestionScreen.dart';




void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/':(context) => const SplashScreen(),
            '/starting':(context) => const StartingScreen(),
            '/main':(context) => const GameModesScreen(),
            '/trivia':(context) => TriviaQuestionScreen()

          }
      )
  );
}


