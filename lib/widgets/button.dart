import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    @required this.buttonText,
    @required this.buttonIcon,
    @required this.routeName,
  });
  final String buttonText;
  final IconData buttonIcon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Icon(
                          buttonIcon,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          buttonText,
                          style: GoogleFonts.raleway(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                FontAwesomeIcons.chevronRight,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
