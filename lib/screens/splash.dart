import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: mainTextColor,
          child: Center(
            child: Text(
              'Pay Up',
              style: GoogleFonts.montserrat(
                letterSpacing: 0.5,
                fontSize: 35,
                color: mainBgColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
