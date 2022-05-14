import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivial_trivia/game_utils/TriviaUtils.dart';
import 'package:trivial_trivia/providers/user_provider.dart';
import 'package:trivial_trivia/screens/StartingScreen.dart';
import 'package:trivial_trivia/services/auth.dart';
import '../game_utils/GameManager.dart';
import 'package:trivial_trivia/models/user.dart' as model;

class GameModesScreen extends StatefulWidget {
  const GameModesScreen({Key? key}) : super(key: key);

  @override
  State<GameModesScreen> createState() => _GameModesScreenState();
}

class _GameModesScreenState extends State<GameModesScreen> {
  bool isUserLoggedIn = false;
  bool isLogoutDialogOpen = false;
  @override
  void initState() {
    super.initState();
    isUserLoggedIn = Service.isUserLoggedIn();
    addData();


  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    GameManager.resetGameManager();
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    model.User user = Provider.of<UserProvider>(context).getUser;

    return WillPopScope(
      onWillPop: ()async {
        if(!Service.isUserLoggedIn()) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => StartingScreen()));
        }else{
          setState(() {
            isLogoutDialogOpen = true;
          });
        }
        return false;
      },
      child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Background4.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SafeArea(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:() {
                              if(!isUserLoggedIn) {
                                Navigator.pop(context);
                              }else{
                                setState(() {
                                  isLogoutDialogOpen = true;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.chevronLeft,
                                        color: Color.fromRGBO(255, 255, 255, 1)),
                                    onPressed: () {}
                                ),
                                Text('Back',
                                    style: GoogleFonts.inter(
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    )),
                                SizedBox(
                                  width: 20.0,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.45,
                          ),
                          Visibility(
                            visible: isUserLoggedIn,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  onPressed: () => Navigator.pushNamed(context, '/search'),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/profile'),
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(162, 227, 255, 1),
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(user.photoURL),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          )

                        ],
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/shadow_gem.png"),
                        fit: BoxFit.cover,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 60.0, bottom: 40.0, left: 40.0, right: 40.0),
                child: SafeArea(
                  child: Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFA2E3FF).withOpacity(0.80),
                                  Color(0xFFA2E3FF).withOpacity(0.55),
                                  Color(0xFFA2E3FF).withOpacity(0.28)
                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.10), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: TextButton(
                              style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                              onPressed: () => GameManager.startGame(
                                  TriviaUtils.getGameArgs(
                                      TriviaUtils.DAILY_CHALLENGE),
                                  context,true),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(size.width*0.5, size.height*0.05, size.width*0.5, size.height*0.05),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    heightFactor: 3,
                                    child: Text(
                                      "Daily Challenge",
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 25.0),
                                    ),
                                  )

                                ],
                              ),
                            )),
                        SizedBox(height: size.height / 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFA2E3FF).withOpacity(0.80),
                                      Color(0xFFA2E3FF).withOpacity(0.55),
                                      Color(0xFFA2E3FF).withOpacity(0.28)
                                      //add more colors
                                    ]),
                                    borderRadius: BorderRadius.circular(18.0),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.10), //shadow for button
                                          blurRadius: 5) //blur radius of shadow
                                    ]),
                                child: TextButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ))),
                                  onPressed: () => GameManager.startGame(
                                      TriviaUtils.getGameArgs(
                                          TriviaUtils.FIFTEEN_QUESTIONS),
                                      context,false),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(size.width*0.05, 35.0, size.width*0.05, 35.0),
                                    child: Column(
                                      children: const [
                                        Text(
                                          "15",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 24.0),
                                        ),
                                        Text(
                                          "Questions",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Spacer(),
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFA2E3FF).withOpacity(0.80),
                                      Color(0xFFA2E3FF).withOpacity(0.55),
                                      Color(0xFFA2E3FF).withOpacity(0.28)
                                      //add more colors
                                    ]),
                                    borderRadius: BorderRadius.circular(18.0),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.10), //shadow for button
                                          blurRadius: 5) //blur radius of shadow
                                    ]),
                                child: TextButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ))),
                                  onPressed: () => GameManager.startGame(
                                      TriviaUtils.getGameArgs(
                                          TriviaUtils.TWENTY_FIVE_QUESTIONS),
                                      context,false),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 35.0),
                                    child: Column(
                                      children: const [
                                        Text(
                                          "25",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 24.0),
                                        ),
                                        Text(
                                          "Questions",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFA2E3FF).withOpacity(0.80),
                                      Color(0xFFA2E3FF).withOpacity(0.55),
                                      Color(0xFFA2E3FF).withOpacity(0.28)
                                      //add more colors
                                    ]),
                                    borderRadius: BorderRadius.circular(18.0),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.10), //shadow for button
                                          blurRadius: 5) //blur radius of shadow
                                    ]),
                                child: TextButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ))),
                                  onPressed: () => GameManager.startGame(
                                      TriviaUtils.getGameArgs(
                                          TriviaUtils.FIFTY_QUESTIONS),
                                      context,false),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 35.0),
                                    child: Column(
                                      children: const [
                                        Text(
                                          "50",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 24.0),
                                        ),
                                        Text(
                                          "Questions",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Spacer(),
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFA2E3FF).withOpacity(0.80),
                                      Color(0xFFA2E3FF).withOpacity(0.55),
                                      Color(0xFFA2E3FF).withOpacity(0.28)
                                      //add more colors
                                    ]),
                                    borderRadius: BorderRadius.circular(18.0),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.10), //shadow for button
                                          blurRadius: 5) //blur radius of shadow
                                    ]),
                                child: TextButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ))),
                                  onPressed: () => GameManager.startGame(
                                      TriviaUtils.getGameArgs(
                                          TriviaUtils.THIRTY_SEC_RELAY),
                                      context,false),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 35.0),
                                    child: Column(
                                      children: const [
                                        Text(
                                          "30 sec",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 22.0),
                                        ),
                                        Text(
                                          "relay",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFFA2E3FF).withOpacity(0.80),
                                  Color(0xFFA2E3FF).withOpacity(0.55),
                                  Color(0xFFA2E3FF).withOpacity(0.28)
                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.10), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: TextButton(
                              style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/customgame'),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(size.width*0.5, 15.0, size.width*0.5, 15.0),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    heightFactor: 3,
                                    child: Text(
                                      "Custom Game",
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 15.0),
                                    ),
                                  )

                                ],
                              ),
                            )),
                      ],
                    )
                  ]),
                ),
              ),
              Visibility(
                visible: isLogoutDialogOpen,
                child: AlertDialog(
                  title: const Text('Logging Out?'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text('Are you sure you want to log out?'),
                      ],
                    ),
                  ),actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Service.signOut(context);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          setState(() {
                            isLogoutDialogOpen = false;
                          });
                        },
                      ),
                    ],
                  )
                ],
                ),

              )
            ],
          )
      ),
    );
  }
}
