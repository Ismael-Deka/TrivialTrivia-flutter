class Question {
  String mCategory = "";
  String mQuestionType = "";
  String mDifficulty = "";
  String mQuestion = "";
  String mCorrectAnswer = "";
  List<String> mIncorrectAnswers = List.empty();

  Question(this.mCategory, this.mQuestionType, this.mDifficulty, this.mQuestion,
      this.mCorrectAnswer, this.mIncorrectAnswers);

}