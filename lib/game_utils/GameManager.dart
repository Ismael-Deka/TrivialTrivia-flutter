import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_trivia/game_utils/ApiCall.dart';
import 'package:trivial_trivia/game_utils/GameMode.dart';
import 'package:trivial_trivia/game_utils/Question.dart';

import 'QuestionLoader.dart';

class GameManager {
  static List<Question> questionList = List.empty(growable: true);
  static int timeLimit = -1;
  static int currentQuestionIndex = -1;
  static int correctAnswerCount = 0;

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

  static String getCorrectAnswer(int questionIndex) {
    return "";
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
    questionList = await QuestionLoader.loadQuestions(ApiCall(gameMode));
    timeLimit = gameMode.mTimeLimit;
    Navigator.pushNamed(context, '/trivia');

  }

  static void resetGameManager(){
    questionList = List.empty(growable: true);
    timeLimit = -1;
    currentQuestionIndex = -1;
    correctAnswerCount = 0;
  }
  static void endGameEarly(BuildContext context) {
    Navigator.pop(context);
    resetGameManager();
  }


  static void endGame(BuildContext context) {
    Navigator.pushReplacementNamed(
      context, '/finalscore',
      arguments: {
        'numCorrect': correctAnswerCount,
        'total': questionList.length},
    );
    resetGameManager();
  }


}
