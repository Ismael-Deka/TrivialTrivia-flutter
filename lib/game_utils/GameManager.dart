import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  static Stopwatch timer = Stopwatch();
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

  static Future<void> postDailyChallenge( GameMode gameMode, int limit,context) async {

    List<Map> questionsForDatabase = List.empty(growable: true);
    DocumentSnapshot d = await FirebaseFirestore.instance
        .collection('daily_challenge')
        .doc('daily_challenge')
        .get();
    int timestamp = d.get('timestamp');
    if(DateTime.now().millisecondsSinceEpoch/1000 - timestamp/1000   > 86400){

      questionList = await QuestionLoader.loadQuestions(ApiCall(gameMode));
      for(Question q in questionList){
        questionsForDatabase.add({ 'category':q.category,
          'correct_answer':q.correctAnswer,
          'difficulty':q.difficulty,
          'type':q.questionType,
          'question':q.question,
          'incorrect_answers':q.incorrectAnswers});
      }
      FirebaseFirestore.instance.collection('daily_challenge')
        .doc('daily_challenge')
        .update({'questions': questionsForDatabase});
      FirebaseFirestore.instance.collection('daily_challenge')
          .doc('daily_challenge')
          .update({'time_limit': limit});
      FirebaseFirestore.instance.collection('daily_challenge')
          .doc('daily_challenge')
          .update({'timestamp': DateTime.now().millisecondsSinceEpoch});
    }else{
      timeLimit = d.get("time_limit");
      for(Map map in d.get("questions")){
        questionList.add(
          Question(
            map['category'],
            map['type'],
            map['difficulty'],
            map['question'],
            map['correct_answer'],
            List<String>.generate(map['incorrect_answers'].length, (index) => map['incorrect_answers'][index])

          )
        );
      }
    }
    timer.start();
    Navigator.pushNamed(context, '/trivia');
  }


  static void startGame(GameMode gameMode, BuildContext context, bool isDailyChallenge) async {
    if(Service.isUserLoggedIn()) {
      points = await service.getPoints(context);
    }
    timeLimit = gameMode.mTimeLimit;
    if(isDailyChallenge){
      postDailyChallenge(gameMode,timeLimit,context);
    }else{
      questionList = await QuestionLoader.loadQuestions(ApiCall(gameMode));
      timer.start();
      Navigator.pushNamed(context, '/trivia');
    }


  }

  static void resetGameManager(){
    questionList = List.empty(growable: true);
    timeLimit = -1;
    currentQuestionIndex = -1;
    correctAnswerCount = 0;
    points = 0;
    pointsGained = 0;
    timer.stop();
    timer.reset();
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
    Navigator.pushReplacementNamed(
      context, '/finalscore',
      arguments: {
        'numCorrect': correctAnswerCount,
        'total': questionList.length,
        'time_completed': (timer.elapsedMilliseconds.toDouble()/1000.0).toString(),
        'points_gained':pointsGained
      },
    );
    if(Service.isUserLoggedIn()) {
        service.addPoints(context, points+pointsGained);
      }
      resetGameManager();
    }
  }

