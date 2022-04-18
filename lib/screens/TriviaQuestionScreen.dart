import 'dart:math';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trivial_trivia/game_utils/GameManager.dart';
import 'package:trivial_trivia/game_utils/Question.dart';
import 'package:trivial_trivia/game_utils/TriviaUtils.dart';


class TriviaQuestionScreen extends HookWidget{

  late List<String> mOptionsList;
  late List<ValueNotifier> selectedOptionStateList;
  late List<ValueNotifier> optionStateList;
  late ValueNotifier questionState;
  late ValueNotifier questionNumber;
  late ValueNotifier questionFontSize;
  late ValueNotifier remainingQuestionCount;

  int correctAnswerIndex = 2;
  bool isOptionSelected = false;
  bool isFirstQuestionLoaded = false;

  TriviaQuestionScreen({Key? key}) : super(key: key);

  void displayNextQuestion(BuildContext context) {

    mOptionsList = List<String>.empty(growable: true);
    Question nextQuestion = GameManager.getNextQuestion(context);
    if(nextQuestion.question != ""){
      questionNumber.value = GameManager.mCurrentQuestionIndex + 1;
      questionState.value = nextQuestion.question;
      if(nextQuestion.question.length > 100){
        questionFontSize.value = 15.0;
      }else if(nextQuestion.question.length > 50){
        questionFontSize.value = 18.0;
      }else{
        questionFontSize.value = 20.0;
      }
      remainingQuestionCount.value = (GameManager.mCurrentQuestionIndex+1)/GameManager.mQuestionList.length;
      displayOptions(nextQuestion);
    }


  }

  void displayOptions(Question nextQuestion){
    int offset = 0;
    String option = "";
    if(TriviaUtils.isQuestionMultipleChoice(nextQuestion)) {
      correctAnswerIndex = Random().nextInt(3);

      for (int i = 0; i < 4; i++) {

        if (i == correctAnswerIndex) {
          option = nextQuestion.correctAnswer;
          offset++;
        } else {
          option = nextQuestion.incorrectAnswers[i - offset];
        }
        mOptionsList.add(option);
        optionStateList[i].value = getOptionButton(option, i);
      }
    }else{
      if(nextQuestion.correctAnswer == "True"){
        correctAnswerIndex = 0;
      }else{
        correctAnswerIndex = 1;
      }
      mOptionsList.add("True");
      mOptionsList.add("False");
      optionStateList[0].value = getOptionButton("True", 0);
      optionStateList[1].value = getOptionButton("False", 1);
      optionStateList[2].value = Column();
      optionStateList[3].value = Column();

    }
  }


  Column getOptionButton(String option, int index){
    double textSize = 0.0;
    if(option.length > 40){
      textSize = 12.0;
    }else if(option.length > 20){
      textSize = 15.0;
    }else{
      textSize = 18.0;
    }
    return Column(children: [
      const SizedBox(
        height: 45.0,
      ),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                selectedOptionStateList[index].value),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )
            )
        ),
        onPressed: () {
          displayCorrectOption(index);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
          child: Text(
            option,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: textSize
            ),
          ),
        ),

      ),
    ],
    );
  }


  void resetOptionColors(){
    for(int i = 0; i < 4; i++){
      selectedOptionStateList[i].value = Colors.white;
    }
    isOptionSelected = false;
  }

  void displayCorrectOption([int index = -1]){
    if(!isOptionSelected) {
      if (index == correctAnswerIndex) {
        selectedOptionStateList[index].value = Colors.greenAccent;
        optionStateList[index].value = getOptionButton(mOptionsList[index], index);
        GameManager.mCorrectAnswerCount++;
      } else if(index == -1){
        selectedOptionStateList[correctAnswerIndex].value = Colors.greenAccent;
        optionStateList[correctAnswerIndex].value = getOptionButton(mOptionsList[correctAnswerIndex], correctAnswerIndex);
      }else {
        selectedOptionStateList[index].value = Colors.redAccent[100];
        selectedOptionStateList[correctAnswerIndex].value = Colors.greenAccent;
        optionStateList[index].value = getOptionButton(mOptionsList[index], index);
        optionStateList[correctAnswerIndex].value = getOptionButton(mOptionsList[correctAnswerIndex], correctAnswerIndex);
      }
      isOptionSelected = true;
    }
  }


  @override
  Widget build(BuildContext context) {

    optionStateList = List.generate(4, (index) => useState(Column()));
    selectedOptionStateList = List.generate(4, (index) => useState(Colors.white));
    remainingQuestionCount = useState(0.5);
    questionState = useState("");
    questionNumber = useState(1);
    questionFontSize = useState(20.0);

    if(isFirstQuestionLoaded == false){
      displayNextQuestion(context);
      isFirstQuestionLoaded = true;
    }

    return Scaffold(
    body:Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Background3.png"),
              fit: BoxFit.fill,
            ),
          ),

          child: Stack(
            children: [ 
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SafeArea(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.chevronLeft,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            onPressed: () => Navigator.pushNamed(context, '/main'),
                          ),
                          Text('Back',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              ))
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
                child:
                Column(
                children: [

                  SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Question " + questionNumber.value.toString(),
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: remainingQuestionCount.value,
                          minHeight: 15.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      questionState.value,
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: questionFontSize.value
                      ),
                      textAlign: TextAlign.center,
                    ),

                  for(int i = 0; i < 4; i++)
                    optionStateList[i].value,
                  const SizedBox(
                    height: 60.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF86C9E7)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )
                        )
                    ),

                    //change navigation 
                    onPressed: (){
                      if(isOptionSelected){
                        resetOptionColors();
                        displayNextQuestion(context);
                      }else{
                        displayCorrectOption();
                      }

                      },
              
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                      child:Text(
                        "NEXT",
                        style: TextStyle(
              
                            fontSize: 16.0
                        ),
                      ),
                    ),
              
                  ),
                    ],
                )),
             ] )
          ),
      ]),
      );

  }

}