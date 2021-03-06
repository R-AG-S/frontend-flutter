import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    @required this.buttonText,
    @required this.routeName,
    @required this.colorKey,
    @required this.imageKey,
    @required this.isIcon,
    @required this.iconData,
  });
  final String buttonText;
  final String routeName;
  final Color colorKey;
  final String imageKey;
  final bool isIcon;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: colorKey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isIcon
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 40,
                          ),
                          child: Icon(
                            iconData,
                            size: 18,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Image(
                            height: 50,
                            image: AssetImage(imageKey),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      buttonText,
                      style: isIcon
                          ? GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                            )
                          : GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: colorKey == whiteColor
                                  ? darkFadeTextColor
                                  : whiteColor,
                            ),
                    ),
                  ),
                ],
              ),
              isIcon
                  ? Container()
                  : Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 18,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonIconCard extends StatelessWidget {
  const ButtonIconCard({
    @required this.buttonText,
    @required this.routeName,
    @required this.colorKey,
    @required this.iconData,
  });
  final String buttonText;
  final String routeName;
  final Color colorKey;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: colorKey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 40,
                    ),
                    child: Icon(
                      iconData,
                      size: 18,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.5,
                    ),
                    child: Text(
                      buttonText,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
