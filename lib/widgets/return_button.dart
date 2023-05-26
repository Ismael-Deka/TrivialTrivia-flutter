import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReturnButton extends StatelessWidget{

  final Function() onTap;

  const ReturnButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => onTap(),
      child: AbsorbPointer(
        child:Row(
          children: [
            const Icon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.white,

            ),
            const SizedBox(
              height: 30.0,
              width: 10.0,
            ),
            Text('Back',
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                )),
            const SizedBox(
              width: 20.0,
            )
          ],
        )
      ),
    );
  }

}