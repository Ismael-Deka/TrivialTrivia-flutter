import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trivial_trivia/screens/CustomGameScreen.dart';
import 'package:trivial_trivia/screens/FinalScoreScreen.dart';
import 'package:trivial_trivia/screens/GameModesScreen.dart';
import 'package:trivial_trivia/screens/Leaderboard.dart';
import 'package:trivial_trivia/screens/PasswordResetScreen.dart';
import 'package:trivial_trivia/screens/ProfilePage.dart';
import 'package:trivial_trivia/screens/RegistrationScreen.dart';
import 'package:trivial_trivia/screens/Settings.dart';
import 'package:trivial_trivia/screens/SignInScreen.dart';
import 'package:trivial_trivia/screens/StartingScreen.dart';
import 'package:trivial_trivia/screens/SplashScreen.dart';
import 'package:trivial_trivia/screens/TriviaQuestionScreen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/':(context) => const SplashScreen(),
            '/starting':(context) => const StartingScreen(),
            '/signin': (context) => const SignIn(),
            '/registration': (context) => const Register(),
            '/resetpassword':(context) => const ResetPassword(),
            '/main':(context) => const GameModesScreen(),
            '/customgame': (context) => CustomGame(),
            '/trivia':(context) => TriviaQuestionScreen(),
            '/finalscore':(context) => const FinalScore(),
            '/leaderboard':(context) => Leaderboard(),
            '/profile':(context) => const Profile(), 
            '/settings': (context) => const Settings(),
            }  
  ));
}


