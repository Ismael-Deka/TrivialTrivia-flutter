import 'dart:typed_data';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trivial_trivia/providers/user_provider.dart';
import 'package:trivial_trivia/services/auth.dart';
import 'package:trivial_trivia/services/utils.dart';
import 'package:trivial_trivia/models/user.dart' as model;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController usernameController = TextEditingController();
  Service service = Service();
  Uint8List? _image;

  

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void updateUserProfile() async {
    setState(() {
    });
    String res = await Service()
        .updateUserProfile(context, username: usernameController.text, profilePic: _image);
    if (res == "Success") {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SafeArea(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.x,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text('Edit Profile',
                          style: GoogleFonts.inter(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ))
                    ],
                  )),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            width: size.width,
            height: size.height * 0.20,
            color: Colors.transparent,
            child: Center(
              child: GestureDetector(
                onTap: selectImage,
                child: AbsorbPointer(
                  child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(
                            162, 227, 255, 1),
                      ),
                      child: Center(
                          child: _image != null
                              ? CircleAvatar(
                            radius: 38,
                            backgroundImage:
                            MemoryImage(
                                _image!),
                          )
                              : CircleAvatar(
                            radius: 38,
                            backgroundImage:
                            NetworkImage(user.photoURL),
                          )
                      )),
                )
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, top: 250),
          child: Text('Change profile picture',
              style: GoogleFonts.inter(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              )
          ),

        ),
          Padding(
            padding: const EdgeInsets.only(left: 65, top: 300),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text('Edit username:', 
                  style: GoogleFonts.inter(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )),
                ), 
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    height: 40,
                    width: 250,
                    child: TextField(

                      controller: usernameController,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 15, right: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          hintText: "Username",
                          hintStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          fillColor: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: updateUserProfile,
                  child: Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(116, 180, 213, 1)),
                      child: Center(
                        child: Text('Done',
                            style: GoogleFonts.inter(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15)),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
