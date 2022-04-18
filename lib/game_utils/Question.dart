import 'package:html/parser.dart';

class Question {
  String category = "";
  String questionType = "";
  String difficulty = "";
  String question = "";
  String correctAnswer = "";
  List<String> incorrectAnswers = List.empty();

  Question([String newCategory = "", String newQuestionType = "", String newDifficulty = "", String newQuestion = "",
      String newCorrectAnswer = "", newIncorrectAnswers]){
    category = newCategory;
    questionType = newQuestionType;
    difficulty = newDifficulty;
    question = parseFragment(newQuestion).text!;
    correctAnswer = newCorrectAnswer;
    if(newIncorrectAnswers != null) {
      incorrectAnswers = newIncorrectAnswers;
    }

  }

}