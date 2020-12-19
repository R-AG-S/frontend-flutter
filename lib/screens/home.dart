import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/backend/userRoomDetails.dart';
import 'package:payup/screens/slideup.dart';
import 'package:payup/screens/userSettings.dart';
import 'package:payup/utilities/constants.dart';
import 'package:latlong/latlong.dart';
import 'package:payup/utilities/data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int counter = 0;
bool isReady = false;
double userLat = 0.0;
double userLong = 0.0;
bool isExpanded = true;
List secondaryKeys = [
  FontAwesomeIcons.userCog,
  FontAwesomeIcons.cog,
  FontAwesomeIcons.solidEdit,
  FontAwesomeIcons.solidChartBar,
];
final int dataCount = 5;
double _panelHeightOpen;
double _panelHeightClosed;
Map roomDetails = Map();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    roomDetails.clear();
    _getLocation();
    super.initState();
    _getDetails();
  }

  _getDetails() async {
    try {
      final data = await userRoomDetails();
      for (int i = 0; i < data.length; i++) {
        setState(() {
          roomDetails[i] = data[i];
        });
      }
      if (roomDetails.isEmpty) {
        Flushbar(
          backgroundColor: redColor,
          title: "Error",
          message: 'Some unexpected error occured. Try again.',
          duration: Duration(seconds: 3),
        )..show(context);
      } else {
        print(roomDetails);
      }
    } catch (e) {
      Flushbar(
        backgroundColor: redColor,
        title: "Error",
        message: 'Some unexpected error occured. Try again.',
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }

  _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      userLat = position.latitude;
      userLong = position.longitude;
    });
  }

  GlobalKey<SlidableState> _slidableKey = GlobalKey();
  final SlidableController slidableController = SlidableController();
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    _panelHeightClosed =
        isExpanded ? MediaQuery.of(context).size.height * .08 : 0.0;
    return SafeArea(
      child: Slidable(
        key: _slidableKey,
        controller: slidableController,
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.20,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: whiteColor,
          body: SlidingUpPanel(
            backdropEnabled: true,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            collapsed: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.gripLines,
                  color: fadeTextColor,
                ),
              ),
            ),
            panel: SlideUpPanel(
              carCount: 12,
              creator: roomDetails[counter]['data']['owner'],
              membCount: roomDetails[counter]['data']['members'].length,
              membersList: roomDetails[counter]['data']['members'],
              petrol: roomDetails[counter]['data']['petrol_price'],
              roomName: roomDetails[counter]['data']['room_name'],
            ),
            body: isReady
                ? Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            height: isExpanded
                                ? MediaQuery.of(context).size.height * 0.66
                                : MediaQuery.of(context).size.height * 0.969,
                            child: FlutterMap(
                              options: new MapOptions(
                                center: LatLng(userLat, userLong),
                                zoom: 14.0,
                              ),
                              layers: [
                                new TileLayerOptions(
                                  urlTemplate:
                                      "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png",
                                  subdomains: ['a', 'b', 'c'],
                                ),
                                new MarkerLayerOptions(
                                  markers: [
                                    new Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(userLat, userLong),
                                      builder: (ctx) => new Container(
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            color: redColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: GestureDetector(
                                  onTap: () =>
                                      _slidableKey.currentState.renderingMode ==
                                              SlidableRenderingMode.none
                                          ? _slidableKey.currentState.open()
                                          : _slidableKey.currentState.close(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1,
                                          color: Colors.black26,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: whiteColor,
                                      child: Icon(
                                        FontAwesomeIcons.bars,
                                        color: fadeTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
                                  left: 10,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isExpanded = isExpanded ? false : true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1,
                                          color: Colors.black26,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: whiteColor,
                                      child: Icon(
                                        FontAwesomeIcons.expand,
                                        color: fadeTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: isExpanded
                                  ? MediaQuery.of(context).size.height * 0.58
                                  : MediaQuery.of(context).size.height * 0.8,
                            ),
                            child: Container(
                              height: 100,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  accentColor: whiteColor,
                                ),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: iconData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index == dataCount - 1) {
                                      return SizedBox(
                                        width: 15,
                                      );
                                    }
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 8,
                                      ),
                                      child: Card(
                                        color: whiteColor,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                FadeInImage.assetNetwork(
                                                  fadeOutDuration:
                                                      Duration(seconds: 1),
                                                  image: iconData[index],
                                                  placeholder:
                                                      'images/place.png',
                                                  height: 50,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'User Name $index',
                                                      style: TextStyle(
                                                        fontFamily: 'Bambino',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: mainTextColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      'User Details',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: mainTextColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      isExpanded
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 8,
                              ),
                              child: FlatButton(
                                minWidth: MediaQuery.of(context).size.width,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                color: mainTextColor,
                                onPressed: () {},
                                child: Text(
                                  'Start Drive',
                                  style: TextStyle(
                                    fontFamily: 'Bambino',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      isExpanded
                          ? Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                                right: 25,
                                bottom: 8,
                              ),
                              child: FlatButton(
                                minWidth: MediaQuery.of(context).size.width,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                color: mainTextColor,
                                onPressed: () {},
                                child: Text(
                                  'Join Drive',
                                  style: TextStyle(
                                    fontFamily: 'Bambino',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                : Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ),
        actions: <Widget>[
          SlideAction(
            child: ListView.builder(
              itemCount: roomDetails.length + 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: SecondaryIcons(
                        iconName: FontAwesomeIcons.plus, routeName: null),
                  );
                } else if (index == 1) {
                  return Column(
                    children: [
                      SecondaryIcons(
                        iconName: secondaryKeys[0],
                        routeName: UserSettings(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Divider(
                          color: whiteColor,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          counter = index - 2;
                        });
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: whiteColor,
                        child: Center(
                          child: Text(
                            roomDetails[index - 2]['data']['room_name']
                                .toString()
                                .toUpperCase()
                                .substring(0, 2),
                            style: TextStyle(
                              fontFamily: 'KumbhSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: mainTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            color: mainTextColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SecondaryIcons extends StatelessWidget {
  const SecondaryIcons({
    @required this.iconName,
    @required this.routeName,
  });
  final Widget routeName;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.5,
        vertical: 4,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => routeName,
            ),
          );
        },
        child: CircleAvatar(
          radius: 25,
          backgroundColor: whiteColor,
          child: Icon(
            iconName,
            color: darkFadeTextColor,
          ),
        ),
      ),
    );
  }
}
