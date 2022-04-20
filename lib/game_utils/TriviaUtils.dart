import 'package:trivial_trivia/game_utils/GameMode.dart';
import 'package:trivial_trivia/game_utils/Question.dart';


class GameParams {
  static const int CATEGORY = 0;
  static const int TYPE = 1;
  static const int DIFFICULTY = 2;
  static const int QUESTION = 3;
  static const int CORRECT_ANSWER = 4;
  static const int INCORRECT_ANSWERS = 5;
}

class TriviaUtils{

   static final List<String> mCategoryList = ["Any Category", "General Knowledge","Entertainment: Books",
     "Entertainment: Film","Entertainment: Music","Entertainment: Musicals & Theatres","Entertainment: Television",
     "Entertainment: Video Games","Entertainment: Board Games","Science & Nature","Science: Computers","Science: Mathematics",
     "Mythology","Sports","Geography","History","Politics","Art","Celebrities","Animals","Vehicles","Entertainment: Comics",
     "Science: Gadgets","Entertainment: Japanese Anime & Manga","Entertainment: Cartoon & Animations"];

   static final List<String> mDifficultyList = ["Easy","Medium","Hard"];
   static final List<String> mQuestionTypeList = ["Multiple Choice","True or False"];
   static final List<String> mGameTypeList = ["Custom Game","30-Second Relay","15-Question Trivia", "25-Question Trivia","50-Question Trivia"];


   static const int CUSTOM_GAME = 0;
   static const int THIRTY_SEC_RELAY = 1;
   static const int FIFTEEN_QUESTIONS = 2;
   static const int TWENTY_FIVE_QUESTIONS = 3;
   static const int FIFTY_QUESTIONS = 4;

   static const int MULTIPLE_CHOICE = 0;
   static const int TRUE_FALSE = 1;

   static const int ANY_CATEGORY = 0;
   static const int MAX_NUM_QUESTIONS = 50;

   static const int NO_TIME_LIMIT = -1;


  static int getCategoryId(String category){
    if(category == mCategoryList[ANY_CATEGORY]) {
      return -1;
    }
    if(mCategoryList.contains(category)){
      int categoryIndex = mCategoryList.indexOf(category);
      return categoryIndex + 9;
    }else {
      return -1;
    }
  }

  static String getCategoryName(int id){
    int categoryLength = mCategoryList.length;
    int offsetId = id - 9;

    if(offsetId < categoryLength && offsetId >= 0){
      return mCategoryList[offsetId];
    }else {
      return "";
    }
  }

  static String getQuestionTypeParam(String questionType){
    if(questionType == mQuestionTypeList[MULTIPLE_CHOICE]){
      return "multiple";
    }else if(questionType == mQuestionTypeList[TRUE_FALSE]){
      return "boolean";
    }else{
      return "";
    }
  }

  static String getQuestionTypeName(String questionTypeParam){
    if(questionTypeParam=="multiple"){
      return mQuestionTypeList[MULTIPLE_CHOICE];
    }else if(questionTypeParam == "boolean"){
      return mQuestionTypeList[TRUE_FALSE];
    }else{
      return "";
  }
  }

  static bool isQuestionMultipleChoice(Question question){
    String questionType = question.questionType;

    if(questionType == "multiple"){
      return true;
    } else {
      return false;
    }

  }

  static GameMode getGameArgs(int gameType){
    switch (gameType){
      case THIRTY_SEC_RELAY:
        return GameMode(mGameTypeList[ANY_CATEGORY],"",MAX_NUM_QUESTIONS,30);

      case FIFTEEN_QUESTIONS:
        return GameMode(mGameTypeList[ANY_CATEGORY],"", 15,NO_TIME_LIMIT);

      case TWENTY_FIVE_QUESTIONS:
        return GameMode(mGameTypeList[ANY_CATEGORY],"", 25,NO_TIME_LIMIT);

      case FIFTY_QUESTIONS:
        return GameMode(mGameTypeList[ANY_CATEGORY],"",MAX_NUM_QUESTIONS,NO_TIME_LIMIT);
    }
    return GameMode("", "", -1, -1);
  }

}

