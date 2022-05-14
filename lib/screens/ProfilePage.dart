import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trivial_trivia/models/user.dart' as model;
import 'package:trivial_trivia/providers/user_provider.dart';
import 'package:trivial_trivia/services/firestore_methods.dart';
import 'package:trivial_trivia/services/utils.dart';
import 'package:trivial_trivia/widgets/follow_button.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({Key? key, required this.uid}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userData = {};
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;
  int rank = 0;

  @override
  void initState() {
    super.initState();
    //addData();
    getData();
  }

  // addData() async {
  //   UserProvider _userProvider = Provider.of(context, listen: false);
  //   await _userProvider.refreshUser();
  // }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnaps = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = userSnaps.data()!;
      followers = userSnaps.data()!['followers'].length;
      following = userSnaps.data()!['following'].length;
      isFollowing = userSnaps
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser?.uid);
      getUserRank();
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  void getUserRank(){

    FirebaseFirestore.instance
        .collection('users')
        .orderBy('points', descending: true)
        .get()
        .then((QuerySnapshot q) {
      for (int i = 0; i < q.docs.length; i++) {
        var d = q.docs[i];
        if(d.get("id") == FirebaseAuth.instance.currentUser?.uid){
          setState(() {
            rank=i+1;
          });
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    //var bottomPadding = mediaQueryData.padding.bottom;
    model.User user = Provider.of<UserProvider>(context).getUser;

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SafeArea(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: ()=> Navigator.pop(context),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.chevronLeft,
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  onPressed: () {},
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text('Back',
                                      style: GoogleFonts.inter(
                                        color: const Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.60,
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.gear,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/settings'),
                          ),
                        ],
                      )),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.20,
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
                            width: 153,
                            height: 153,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(162, 227, 255, 1),
                            ),
                            child: Center(
                              child: Container(
                                width: 132.79,
                                height: 132.79,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      //image: AssetImage('assets/Ellipse 425.png'),
                                      image: NetworkImage(userData['photoURL']),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                        width: size.width,
                        height: size.height * 0.05,
                        color: Colors.transparent,
                        child: Center(
                            //update username to current user's username
                            child: Text(
                                //user.username,
                                userData['username'],
                                style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                )))),
                  ),
                  FirebaseAuth.instance.currentUser?.uid == widget.uid
                      ? FollowButton(
                          backgroundColor:
                              const Color.fromRGBO(249, 240, 240, 1)
                                  .withOpacity(.80),
                          text: 'Edit Profile',
                          function: () {
                            Navigator.pushNamed(context, '/editprofile');
                          },
                        )
                      : isFollowing
                          ? FollowButton(
                              backgroundColor:
                                  const Color.fromRGBO(121, 155, 243, 1)
                                      .withOpacity(.80),
                              text: 'Unfollow',
                              function: () async {
                                // check if id or uid???
                                await FireStoreMethods().followUser(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    userData['id']);
                                setState(() {
                                  isFollowing = false;
                                  followers--;
                                });
                              },
                            )
                          : FollowButton(
                              backgroundColor:
                                  const Color.fromRGBO(66, 119, 255, 1)
                                      .withOpacity(.80),
                              text: 'Follow',
                              function: () async {
                                await FireStoreMethods().followUser(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    userData['id']);
                                setState(() {
                                  isFollowing = true;
                                  followers++;
                                });
                              },
                            ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                        width: size.width,
                        height: size.height * 0.09,
                        color: Colors.transparent,
                        child: Center(
                            child: Container(
                                width: size.width * 0.60,
                                height: size.height * 0.09,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color.fromRGBO(134, 201, 231, 1)
                                      .withOpacity(.80),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildstatColumn(followers, 'followers'),
                                    buildstatColumn(following, 'following')
                                  ],
                                )))),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.12,
                        color: Colors.transparent,
                        child: Center(
                            child: Container(
                          width: size.width * 0.75,
                          height: size.height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(249, 240, 240, 1)
                                .withOpacity(.80),
                          ),
                          child: Center(
                              //update current rank
                              child: Text('Current Rank: #'+rank.toString(),
                                  style: GoogleFonts.inter(
                                    color:
                                        const Color.fromRGBO(150, 134, 134, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ))),
                        )),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.12,
                        color: Colors.transparent,
                        child: Center(
                            child: Container(
                                width: size.width * 0.75,
                                height: size.height * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromRGBO(249, 240, 240, 1)
                                      .withOpacity(.80),
                                ),
                                child: Center(
                                  child: Container(
                                      width: size.width * 0.85,
                                      height: size.height * 0.10,
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: size.width * 0.20,
                                            height: size.height * 0.10,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/Group 1204.png"),
                                              ),
                                            ),
                                          ),
                                          //update total points
                                          Text(userData['points'].toString()+' pts',
                                              style: GoogleFonts.inter(
                                                  color: const Color.fromRGBO(
                                                      150, 134, 134, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700))
                                        ],
                                      )),
                                ))),
                      )),
                ],
              )
            ]),
          ));
  }

  Column buildstatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(num.toString(),
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
        Text(label,
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ))
      ],
    );
  }
}
