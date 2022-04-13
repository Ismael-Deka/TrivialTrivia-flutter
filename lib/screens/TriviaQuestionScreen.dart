import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trivial_trivia/game_utils/Question.dart';

class TriviaQuestionScreen extends HookWidget{


  late Question mCurrentQuestion;
  late List<Question> mQuestionList;
  late List<String> mSelectedAnswerList;

  String mQuestion = "";
  List<String> mOptions = List.empty();
  int correctAnswerIndex = 2;
  bool isOptionSelected = false;

  TriviaQuestionScreen({Key? key}) : super(key: key);


  void updateOptionButtons(List<ValueNotifier> stateList, int index){
    if(!isOptionSelected) {
      if (index == correctAnswerIndex) {
        stateList[index].value = Colors.greenAccent;

      } else {
        stateList[index].value = Colors.redAccent[100];
        stateList[correctAnswerIndex].value = Colors.greenAccent;
      }
      isOptionSelected = true;
    }
  }


  @override
  Widget build(BuildContext context) {

    List<ValueNotifier> optionStateList = List.generate(4, (index) => useState(Colors.white));
    final questionState = useState("");

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
                      Text("Question 1",
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
                    height: 45.0,
                  ),
                  Text(
                      questionState.value,
                      style: const TextStyle(
                        color: Colors.white,
                          fontSize: 20.0
                      ),
                      textAlign: TextAlign.center,
                    ),
              
                  for(int i = 0; i < 4; i++)
                    Column(children: [
                    const SizedBox(
                      height: 45.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(optionStateList[i].value),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      onPressed: (){updateOptionButtons(optionStateList, i);},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                        child:Text(
                          "Option #$i",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0
                          ),
                        ),
                      ),
              
                    ),
                    ],
                    ),
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
                    onPressed: () => Navigator.pushNamed(context, '/finalscore'),
              
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