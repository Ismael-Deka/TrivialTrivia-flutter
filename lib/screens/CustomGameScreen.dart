import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivial_trivia/game_utils/GameManager.dart';
import 'package:trivial_trivia/game_utils/GameMode.dart';
import 'package:trivial_trivia/game_utils/TriviaUtils.dart';
import 'package:wheel_chooser/wheel_chooser.dart';


class CustomGame extends HookWidget {

  late List<ValueNotifier> selectedDifficultyStateList;
  late ValueNotifier isTimeLimitSelected;
  late ValueNotifier numQuestions;


  int minutes = 2;
  int seconds = 0;

  String selectedCategory = TriviaUtils.mCategoryList[0];

  int selectedDifficultyIndex = -1;

  CustomGame({Key? key}) : super(key: key);

  void selectDifficulty(int index){
    selectedDifficultyIndex = index;
    for(int i = 0; i < 3; i++){
      selectedDifficultyStateList[i].value = const Color.fromRGBO(248, 239, 239, 1);
    }
    selectedDifficultyStateList[index].value = Colors.grey;
  }

  void startCustomGame(BuildContext context){
    if(selectedDifficultyIndex == -1){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Select Difficulty."),
      ));
    }else{
      if(isTimeLimitSelected.value == true){
        GameManager.startGame(
            GameMode(
                selectedCategory,
                TriviaUtils.getCategoryName(selectedDifficultyIndex),
                numQuestions.value,
                (minutes*60)+seconds)
            , context);
      }else{
        GameManager.startGame(
            GameMode(
                selectedCategory,
                TriviaUtils.getCategoryName(selectedDifficultyIndex),
                numQuestions.value,
                -1),
            context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;

    selectedDifficultyStateList = List.generate(3, (index) => useState(const Color.fromRGBO(248, 239, 239, 1)));
    isTimeLimitSelected = useState(false);
    numQuestions = useState(15);

    final timeLimitButtonColor = useState(const Color.fromRGBO(248, 239, 239, 1));


    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Background3.png"),
              fit: BoxFit.cover,
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
                            onPressed: () =>
                                Navigator.pushNamed(context, '/main'),
                          ),
                          Text('Back',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              )),
                        ],
                      )),
                ),
              ),
              Positioned(
                  top: 130,
                  left: 75,
                  child: Text('Custom Game',
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ))),
              Column(

                  children: [
                    const SizedBox(
                      height: 200.0,
                    ),
                    Container(
                      width: size.width,
                      height: size.height - 200,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(162, 227, 255, 1)
                              .withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
                        child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text("Difficulty",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
                                onTap: () => selectDifficulty(0),
                                child: Container(
                                    width: 308.01,
                                    height: 34,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: selectedDifficultyStateList[0].value),
                                    child: Center(
                                      child: Text('Easy',
                                          style: GoogleFonts.inter(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.6700000166893005),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700)),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
                                onTap: () => selectDifficulty(1),
                                child:Container(
                                    width: 308.01,
                                    height: 34,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: selectedDifficultyStateList[1].value),
                                    child: Center(
                                      child: Text('Medium',
                                          style: GoogleFonts.inter(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.6700000166893005),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700)),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
                                onTap: () => selectDifficulty(2),
                                child:Container(
                                  width: 308.01,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: selectedDifficultyStateList[2].value),
                                  child: Center(
                                    child: Text('Hard',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.6700000166893005),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  )),
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text("Number of Questions",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Wrap(
                                children:[
                                Container(
                                  width: 176,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color.fromRGBO(
                                          248, 239, 239, 1)),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 12),
                                      IconButton(
                                          icon: const FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.6700000166893005)),
                                          onPressed: () {
                                              if(numQuestions.value > 1){
                                                numQuestions.value--;
                                              }
                                            },
                                        ),

                                      const SizedBox(width: 15),
                                      Text(numQuestions.value.toString(),
                                          style: GoogleFonts.inter(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.6700000166893005),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(width: 17),
                                      IconButton(
                                          icon: const FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.6700000166893005)),
                                          onPressed: () {
                                            if(numQuestions.value < TriviaUtils.MAX_NUM_QUESTIONS){
                                            numQuestions.value++;
                                          }},
                                        ),

                                    ],
                                  )
                                ),
                                ]
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(""
                                  "Categories",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Container(
                              width: 308.01,
                              height: 130.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromRGBO(255, 255, 255, 1)),
                              child:WheelChooser(
                                listHeight: 120.0,
                                datas: TriviaUtils.mCategoryList,
                                unSelectTextStyle: const TextStyle(color: Colors.grey),
                                onValueChanged: (s) { selectedCategory = s; },
                              ),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text("Time Limit?",
                                  style: GoogleFonts.inter(
                                    color:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Visibility(
                              visible: isTimeLimitSelected.value,
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Container(
                                      width: 100.01,
                                      height: 130.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: const Color.fromRGBO(255, 255, 255, 1)),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                              "Minutes"
                                          ),
                                          WheelChooser(
                                            listWidth: 50.01,
                                            listHeight: 120.0,
                                            datas: [
                                              for(int i = 0; i<= 99;i++)
                                                i.toString().padLeft(2,'0')
                                            ],
                                            magnification: 1.5,
                                            startPosition: 2,
                                            onValueChanged: (s) { minutes = int.parse(s); },
                                            unSelectTextStyle: const TextStyle(color: Colors.grey),
                                          ),
                                          const Text(
                                              ":"
                                          ),
                                          WheelChooser(
                                            listWidth: 50.01,
                                            listHeight: 120.0,
                                            datas: [
                                              for(int i = 0; i<= 99;i++)
                                                i.toString().padLeft(2,'0')
                                            ],
                                            magnification: 1.5,
                                            onValueChanged: (s) { seconds = int.parse(s); },
                                            unSelectTextStyle: const TextStyle(color: Colors.grey),
                                          ),
                                          const Text(
                                              "Seconds"
                                          ),
                                        ],
                                      )
                                  )
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Row(children: [
                                  GestureDetector(
                                    onTap:(){
                                      if(isTimeLimitSelected.value == false) {
                                        isTimeLimitSelected.value = true;
                                        timeLimitButtonColor.value = Colors.grey;
                                      }else{
                                        isTimeLimitSelected.value = false;
                                        timeLimitButtonColor.value = const Color.fromRGBO(248, 239, 239, 1);
                                      }
                                    },
                                    child: Container(
                                        width: 97,
                                        height: 86,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/Alarm.png')),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: timeLimitButtonColor.value
                                        )
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 97,
                                      height: 86,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Close_SM.png')),
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: const Color.fromRGBO(
                                              248, 239, 239, 1)))
                                ])),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )
                                    )
                                ),
                                onPressed: () {
                                  startCustomGame(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                                  child: Text(
                                    "START",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),

                              ),
                            )

                          ],
                        ),
                      )
                    )])
            ],
          )),
    );
  }
}

