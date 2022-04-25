import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_trivia/game_utils/ApiCall.dart';
import 'package:trivial_trivia/game_utils/GameMode.dart';
import 'package:trivial_trivia/game_utils/Question.dart';

import '../services/auth.dart';
import 'QuestionLoader.dart';

class GameManager {
  static List<Question> questionList = List.empty(growable: true);
  static int timeLimit = -1;
  static double timeRemaining = -1;
  static int currentQuestionIndex = -1;
  static int correctAnswerCount = 0;
  static int points = 0;
  static int pointsGained = 0;
  static Service service = Service();


  static void setQuestion(List<Question> newQuestionList) {
    questionList = newQuestionList;
  }

  static void setTimeLimit(int newTimeLimit) {
    timeLimit = newTimeLimit;
  }

  static int getTotalQuestionCount() {
    return questionList.length;
  }

  static int getRemainingQuestionCount() {
    return currentQuestionIndex-(currentQuestionIndex + 1);
  }

  static bool setSelectedAnswer(String answer) {
    if(answer == questionList[currentQuestionIndex].correctAnswer){
      correctAnswerCount++;
      return true;
    }else{
      return false;
    }
  }

  static Question getNextQuestion(BuildContext context) {
    if(questionList.length > currentQuestionIndex+1){
      currentQuestionIndex++;
      return questionList[currentQuestionIndex];
    }else{
      endGame(context);
      return Question();
    }

  }


  static void startGame(GameMode gameMode, BuildContext context) async {
    points = await service.getPoints(context);
    questionList = await QuestionLoader.loadQuestions(ApiCall(gameMode));
    timeLimit = gameMode.mTimeLimit;
    Navigator.pushNamed(context, '/trivia');

  }

  static void resetGameManager(){
    questionList = List.empty(growable: true);
    timeLimit = -1;
    currentQuestionIndex = -1;
    correctAnswerCount = 0;
    points = 0;
    pointsGained = 0;
  }
  static void endGameEarly(BuildContext context) {
    Navigator.pop(context);
    resetGameManager();
  }

  static void addPoints(String difficulty){

    if(difficulty == "Easy"){
      pointsGained += 10;
    }else if(difficulty == "Medium"){
      pointsGained += 30;
    }else{
      pointsGained += 60;
    }
  }




  static void endGame(BuildContext context) {
    if(timeLimit > -1) {
      Navigator.pushReplacementNamed(
        context, '/finalscore',
        arguments: {
          'numCorrect': correctAnswerCount,
          'total': questionList.length,
          'time_completed': (timeLimit - timeRemaining).toStringAsFixed(3),
          'points_gained':pointsGained
        },
      );
    }else{
      Navigator.pushReplacementNamed(
        context, '/finalscore',
        arguments: {
          'numCorrect': correctAnswerCount,
          'total': questionList.length,
          'points_gained':pointsGained
        },
      );
    }
      //service.addPoints(context, points+pointsGained);
      resetGameManager();
    }
  }

