import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: mainBgColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Image(
                    image: AssetImage('images/image.png'),
                  ),
                ),
                Text(
                  'PayUp',
                  style: TextStyle(
                    fontFamily: 'Bambino',
                    fontSize: 35,
                    color: whiteColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
