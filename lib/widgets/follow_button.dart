import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final String text;
  const FollowButton({ Key? key, 
    required this.backgroundColor,
    required this.text,
    this.function
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    return GestureDetector(
      onTap: function,
      child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.04,
                    color: Colors.transparent,
                    child: Center(
                        child: Container(
                      width: size.width * 0.35,
                      height: size.height * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: backgroundColor,
                      ),
                      child: Center(
                          child: Text(text,
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(150, 134, 134, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ))),
                    )),
                  )
      ),
    );
  }
}