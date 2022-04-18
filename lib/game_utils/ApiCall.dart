import 'package:trivial_trivia/game_utils/GameMode.dart';
import 'package:trivial_trivia/game_utils/TriviaUtils.dart';

class ApiCall{
  final String LOG_TAG = "ApiCall";
  final String URL_BASE = "https://opentdb.com/api.php?";
  int mNumQuestions = -1;
  int mCategory = -1;
  String mDifficulty = "";

  ApiCall(GameMode gameMode){
    mNumQuestions = gameMode.mNumQuestions;
    mCategory = TriviaUtils.getCategoryId(gameMode.mCategory);
    mDifficulty = gameMode.mDifficulty;
  }

  Uri buildApiCall(){
    String url="";

    url= URL_BASE;

    if(mNumQuestions > 0){
      url += "amount="+ mNumQuestions.toString();
    }
    if(mCategory >= 9 && mCategory <= 32){
      url += "&category="+mCategory.toString();
    }
    if(mDifficulty != ""){
      url += "&difficulty=" + mDifficulty.toLowerCase();
    }
    return Uri.parse(url);
  }
}