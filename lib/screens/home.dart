import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:latlong/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

double userLat = 0.0;
double userLong = 0.0;
bool isExpanded = true;
List secondaryKeys = [
  FontAwesomeIcons.cog,
  FontAwesomeIcons.edit,
  FontAwesomeIcons.chartBar,
];
final int dataCount = 5;
double _panelHeightOpen;
double _panelHeightClosed;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getLocation();
    super.initState();
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
    _panelHeightClosed = MediaQuery.of(context).size.height * .08;
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
            panel: Container(
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
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: Column(
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
                              // Navigator.of(context).push(_createRoute());
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
                            itemCount: dataCount,
                            itemBuilder: (BuildContext context, int index) {
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://picsum.photos/id/${index + 40}/300/300',
                                                ),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
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
                                                  fontWeight: FontWeight.w400,
                                                  color: mainTextColor,
                                                ),
                                              ),
                                              Text(
                                                'User Details',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
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
                // isExpanded
                //     ? SizedBox(
                //         height: 10,
                //       )
                //     : Container(),
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
                            'Driver',
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
                            'Passenger',
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
            ),
          ),
        ),
        secondaryActions: [
          SlideAction(
            color: mainTextColor,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: secondaryKeys.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: whiteColor,
                          child: Icon(
                            secondaryKeys[index],
                            color: darkFadeTextColor,
                          ),
                        ),
                      ),
                      Divider(
                        color: whiteColor,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
        actions: <Widget>[
          SlideAction(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: whiteColor,
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: darkFadeTextColor,
                            ),
                          ),
                        ),
                        Divider(
                          color: whiteColor,
                          thickness: 1.0,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: whiteColor,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/id/${index + 30}/300/300',
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
