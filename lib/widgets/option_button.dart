import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget{
  final Function() onTap;
  final ValueNotifier color;
  final String text;

  const OptionButton({Key? key,
    required this.onTap,
    required this.color,
    required this.text,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double textSize = 0.0;

    if(text.length > 40){
      textSize = 12.0;
    }else if(text.length > 20){
      textSize = 15.0;
    }else{
      textSize = 18.0;
    }

    Size size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(
        height: size.height*0.05,
      ),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                color.value),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )
            )
        ),
        onPressed: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
          child: Text(
            text,
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


}