import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:payup/utilities/constants.dart';

class SlideUpPanel extends StatefulWidget {
  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class _SlideUpPanelState extends State<SlideUpPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: FaIcon(
              FontAwesomeIcons.gripLines,
              color: fadeTextColor,
            ),
          ),
          Material(
            elevation: 5.0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Room Name',
                      style: TextStyle(
                        fontFamily: 'Bambino',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: mainTextColor,
                      ),
                    ),
                    Text(
                      'Created By User Name',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: darkFadeTextColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FontAwesomeIcons.userFriends,
                                color: fadeTextColor,
                                size: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Members Count 12',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: fadeTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FontAwesomeIcons.carSide,
                                color: fadeTextColor,
                                size: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Cars Listed 12',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: fadeTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 25,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularKeys(
                  courseName: 'Logs',
                  gradientKey: gradient0,
                  iconData: FontAwesomeIcons.info,
                ),
                CircularKeys(
                  courseName: 'Trips',
                  gradientKey: gradient1,
                  iconData: FontAwesomeIcons.mapSigns,
                ),
                CircularKeys(
                  courseName: 'Pick Me',
                  gradientKey: gradient2,
                  iconData: FontAwesomeIcons.mapMarkerAlt,
                ),
                CircularKeys(
                  courseName: 'Dues',
                  gradientKey: gradient3,
                  iconData: FontAwesomeIcons.rupeeSign,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 7,
            color: dividerfadeColor,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Participants',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: darkFadeTextColor,
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: darkFadeTextColor,
                ),
                Container(
                  height: 100,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      accentColor: whiteColor,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                    'images/svg/01.svg',
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularKeys extends StatelessWidget {
  const CircularKeys({
    @required this.courseName,
    @required this.gradientKey,
    @required this.iconData,
  });
  final String courseName;
  final Gradient gradientKey;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientButton(
            shape: CircleBorder(),
            shapeRadius: BorderRadius.circular(0),
            child: Icon(
              iconData,
              size: 18,
            ),
            callback: () {},
            increaseHeightBy: 10,
            increaseWidthBy: 10,
            gradient: gradientKey,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            courseName,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkFadeTextColor,
            ),
          )
        ],
      ),
    );
  }
}
