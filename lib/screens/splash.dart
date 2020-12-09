import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              children: [
                FaIcon(
                  FontAwesomeIcons.car,
                  color: whiteColor,
                  size: 32,
                ),
                Text(
                  'Pay Up',
                  style: GoogleFonts.montserrat(
                    letterSpacing: 0.5,
                    fontSize: 35,
                    color: whiteColor,
                    fontWeight: FontWeight.w400,
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
