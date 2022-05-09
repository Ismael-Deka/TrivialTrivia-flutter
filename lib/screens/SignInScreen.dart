import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:trivial_trivia/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  Service service = Service();

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Service().loginUser(context,
        email: emailController.text.trim(), password: passwordController.text);
    if (res == "Success") {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
    setState(() {
      _isLoading = false;
    });
  }

  void googleSignIn(BuildContext context) async {
    await service.loginWithGoogle(context).then(
            (bool value) {
          if (value) {
            Navigator.pushReplacementNamed(context, '/main');
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    var bottomPadding = mediaQueryData.padding.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Stack(children: <Widget>[
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
                                  Navigator.pushNamed(context, '/starting'),
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
                Column(
                  children: [
                    SizedBox(
                      height: size.height*0.2,
                    ),
                    Text('Welcome back',
                        style: GoogleFonts.inter(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        )),
                    SizedBox(
                        height: size.height*0.02
                    ),
                    Stack(
                      children: <Widget>[
                        Align(
                            alignment: const Alignment(0, 0.10),
                            child: ClipRect(
                                child: Container(

                                    width: size.width*0.75,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: size.height*0.05,
                                        ),
                                        Text('Sign In',
                                            style: GoogleFonts.inter(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: 35,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic,
                                            )),
                                        SizedBox(
                                          height: size.height*0.02,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 250,
                                          child: TextField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                ),
                                                filled: true,
                                                hintText: "Email",
                                                hintStyle: const TextStyle(
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                                fillColor: Colors.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height*0.02,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 250,
                                          child: TextField(
                                            controller: passwordController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                ),
                                                filled: true,
                                                hintText: "Password",
                                                hintStyle: const TextStyle(
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                                fillColor: Colors.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                        Row (
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                                onTap: () => Navigator.pushNamed(
                                                    context, '/resetpassword'),
                                                child: Text('Forgot Password?',
                                                    style: GoogleFonts.inter(
                                                      color: const Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w600,
                                                    ))),
                                            SizedBox(
                                              width: size.width*0.1,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height*0.02,
                                        ),
                                        GestureDetector(
                                          onTap: loginUser,
                                          child: Container(
                                              width: 140,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                              child: Center(
                                                child: _isLoading
                                                    ? const CircularProgressIndicator(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1))
                                                    : Text('Login',
                                                    style: GoogleFonts.inter(
                                                        color: const Color
                                                            .fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontSize: 15)),
                                              )),

                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(size.width*0.1, size.height*0.02, size.width*0.1, size.height*0.02),
                                          child: const Divider(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SignInButton(
                                            Buttons.google,

                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            onPressed: (){
                                              googleSignIn(context);
                                            }
                                        ),
                                        SizedBox(
                                          height: size.height*0.04,
                                        )
                                      ],
                                    )))),
                      ],
                    ),
                    SizedBox(
                      height: size.height*0.05
                    ),
                    Text('Need an account?',
                        style: GoogleFonts.inter(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        )),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/registration'),
                      child: Container(
                          width: 130,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.5)),
                          child: Center(
                            child: Text('Register',
                                style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15)),
                          )),
                    )
                  ],
                ),

              ]),
            )));
  }
}
