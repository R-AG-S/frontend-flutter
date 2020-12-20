import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:payup/backend/getUserData.dart';
import 'package:payup/backend/userData.dart';
import 'package:payup/screens/generalSettings.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/utilities/data.dart';
import 'package:payup/widgets/button.dart';

bool isReady = false;
Map userData = Map();
String creator;

class SlideUpPanel extends StatefulWidget {
  SlideUpPanel({
    @required this.roomName,
    @required this.creator,
    @required this.membCount,
    @required this.carCount,
    @required this.membersList,
    @required this.petrol,
  });
  final String roomName;
  final String creator;
  final int membCount;
  final int carCount;
  final petrol;
  final membersList;
  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class _SlideUpPanelState extends State<SlideUpPanel> {
  @override
  void initState() {
    isReady = false;
    userData.clear();
    getUsers();
    super.initState();
  }

  getUsers() async {
    try {
      creator = await findUserData(widget.creator);
      print(creator);
      for (int i = 0; i < widget.membersList.length; i++) {
        userData[i] = await getUserData(widget.membersList[i]);
      }
      print(userData);
      // setState(() {
      //   isReady = true;
      // });
    } catch (e) {
      Flushbar(
        backgroundColor: redColor,
        title: "Error",
        message: 'Error occurred.',
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: SingleChildScrollView(
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
                          widget.roomName,
                          style: TextStyle(
                            fontFamily: 'Bambino',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: mainTextColor,
                          ),
                        ),
                        Text(
                          'Created By ' + creator,
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
                                      'Members Count ' +
                                          widget.membCount.toString(),
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
                      route: null,
                    ),
                    CircularKeys(
                      courseName: 'Dues',
                      gradientKey: gradient1,
                      iconData: FontAwesomeIcons.rupeeSign,
                      route: null,
                    ),
                    CircularKeys(
                      courseName: 'Pick Me',
                      gradientKey: gradient2,
                      iconData: FontAwesomeIcons.mapMarkerAlt,
                      route: null,
                    ),
                    CircularKeys(
                      courseName: 'Settings',
                      gradientKey: gradient3,
                      iconData: FontAwesomeIcons.cog,
                      route: Settings(),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 7,
                color: dividerfadeColor,
              ),
              ButtonCard(
                buttonText: "Listed Cars",
                routeName: null,
                imageKey: 'images/car01.png',
                colorKey: whiteColor,
                iconData: null,
                isIcon: false,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
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
                      isReady
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: userData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FadeInImage.assetNetwork(
                                          fadeOutDuration: Duration(seconds: 1),
                                          image: userData[index]['dp'] == null
                                              ? iconData[10]
                                              : userData[index]['dp'],
                                          placeholder: 'images/place.png',
                                          height: 45,
                                        ),
                                        Text(
                                          userData[index]['name'] == null
                                              ? "Unknown"
                                              : userData[index]['name'],
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: darkFadeTextColor,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.solidCircle,
                                          color: index % 2 == 0
                                              ? Colors.green
                                              : Colors.red,
                                          size: 10,
                                        )
                                      ],
                                    ),
                                    Divider()
                                  ],
                                );
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    mainTextColor),
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircularKeys extends StatelessWidget {
  const CircularKeys({
    @required this.courseName,
    @required this.gradientKey,
    @required this.iconData,
    @required this.route,
  });
  final String courseName;
  final Gradient gradientKey;
  final IconData iconData;
  final route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => route,
          ),
        );
      },
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
            callback: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => route,
                ),
              );
            },
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
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
