import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_trivia/game_utils/ApiCall.dart';
import 'package:trivial_trivia/game_utils/GameMode.dart';
import 'package:trivial_trivia/game_utils/Question.dart';

import 'QuestionLoader.dart';

class GameManager {
  static List<Question> mQuestionList = List.empty(growable: true);
  static int mTimeRemaining = -1;
  static int mCurrentQuestionIndex = -1;
  static int mCorrectAnswerCount = 0;

  static void setQuestion(List<Question> questionList) {
    mQuestionList = questionList;
  }

  static void setTimeLimit(int timeLimit) {
    mTimeRemaining = timeLimit;
  }

  static int getTotalQuestionCount() {
    return mQuestionList.length;
  }

  static int getRemainingQuestionCount() {
    return mCurrentQuestionIndex-(mCurrentQuestionIndex + 1);
  }

  static bool setSelectedAnswer(String answer) {
    if(answer == mQuestionList[mCurrentQuestionIndex].correctAnswer){
      mCorrectAnswerCount++;
      return true;
    }else{
      return false;
    }
  }

  static String getCorrectAnswer(int questionIndex) {
    return "";
  }

  static Question getNextQuestion(BuildContext context) {
    if(mQuestionList.length > mCurrentQuestionIndex+1){
      mCurrentQuestionIndex++;
      return mQuestionList[mCurrentQuestionIndex];
    }else{
      endGame(context);
      return Question();
    }

  }

  static void startTimer(BuildContext context) {
    if (mTimeRemaining != -1) {
      Timer(Duration(seconds: mTimeRemaining), () => endGame(context));
    }
  }

  static void startGame(GameMode gameMode, BuildContext context) async {
    mQuestionList = await QuestionLoader.loadQuestions(ApiCall(gameMode));
    mTimeRemaining = gameMode.mTimeLimit;
    Navigator.pushNamed(context, '/trivia');
    startTimer(context);

  }

  static void resetGameManager(){
    mQuestionList = List.empty(growable: true);
    mTimeRemaining = -1;
    mCurrentQuestionIndex = -1;
    mCorrectAnswerCount = 0;
  }

  static void endGame(BuildContext context) {
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
    Navigator.pushReplacementNamed(
      context, '/finalscore',
      arguments: {
        'numCorrect': mCorrectAnswerCount,
        'total': mQuestionList.length},
    );
    resetGameManager();
  }


}
