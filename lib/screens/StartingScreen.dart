import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget{
  const StartingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Background3.png"),
          fit: BoxFit.fill,
        ),
      ),
    ),
      Column(
        children: [
          Image(
            image: AssetImage("assets/Logo.png"),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 90.0,
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
            onPressed: ()=>Navigator.pushNamed(context, '/main'),

            child: const Padding(
              padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
              child:Text(
                "Continue as Guest",
                style: TextStyle(

                    fontSize: 12.0
                ),
              ),
            ),

          ),
        ],
      )
      ],
    );
  }

}