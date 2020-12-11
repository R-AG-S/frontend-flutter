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
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('images/icon.png'),
                  ),
                ),
                Text(
                  'PayUp',
                  style: GoogleFonts.montserrat(
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
