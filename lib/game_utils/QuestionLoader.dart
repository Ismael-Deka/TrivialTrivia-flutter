import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:trivial_trivia/game_utils/ApiCall.dart';
import 'package:trivial_trivia/game_utils/Question.dart';
import 'dart:convert';
class QuestionLoader{

  static Future<List<Question>> loadQuestions(ApiCall apiCall) async {
    Uri url = apiCall.buildApiCall();
    String jsonResponse = await http.read(url);
    if (jsonResponse != "") {
      return getQuestions(jsonResponse);
    } else {
      return List<Question>.empty();
    } // TODO: Differentiate empty json response from No internet

  }
  static List<Question> getQuestions(String jsonResponse){

      List<Question> questions = List<Question>.empty(growable: true);

      var reader = jsonDecode(jsonResponse);
      List<dynamic> arr = reader["results"];
      for(int i = 0; i < arr.length;i++) {
        Question tempQuestion = Question();
        reader = arr[i];
        tempQuestion.category = reader["category"];
        tempQuestion.questionType = reader["type"];
        tempQuestion.difficulty = reader["difficulty"];
        tempQuestion.question = parseFragment(reader["question"]).text.toString();
        tempQuestion.correctAnswer = parseFragment(reader["correct_answer"]).text.toString();
        tempQuestion.incorrectAnswers = getIncorrectAnswers(reader["incorrect_answers"]);
        questions.add(tempQuestion);

      }

      return questions;
    }

   static List<String> getIncorrectAnswers(List<dynamic> array) {
    List<String> incorrectList = List<String>.empty(growable: true);
    for(int i = 0; i < array.length;i++){
      incorrectList.add(parseFragment(array[i].toString()).text.toString());
    }
    return incorrectList;


    }





}