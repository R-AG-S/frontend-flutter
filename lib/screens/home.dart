import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:latlong/latlong.dart';
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
];
final int dataCount = 5;

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
    return SafeArea(
      child: Slidable(
        key: _slidableKey,
        controller: slidableController,
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.20,
        // secondaryActions: [
        //   Column(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.only(
        //           left: 15,
        //           right: 15,
        //           top: 5,
        //         ),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //             color: whiteColor,
        //             border: Border.all(
        //               color: Colors.white,
        //             ),
        //             borderRadius: BorderRadius.all(
        //               Radius.circular(10),
        //             ),
        //           ),
        //           padding: EdgeInsets.all(10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Insights',
        //                 style: GoogleFonts.josefinSans(
        //                   fontSize: 18,
        //                   color: bottomTextColor,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                   vertical: 15,
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Padding(
        //                       padding: EdgeInsets.all(8.0),
        //                       child: Text(
        //                         'Quantity',
        //                         style: GoogleFonts.josefinSans(
        //                           fontSize: 16,
        //                           color: bottomTextColor,
        //                           fontWeight: FontWeight.w600,
        //                         ),
        //                       ),
        //                     ),
        //                     LinearPercentIndicator(
        //                       percent: 0.8,
        //                       backgroundColor: whiteColor,
        //                       maskFilter: MaskFilter.blur(BlurStyle.solid, 0),
        //                       linearGradient: LinearGradient(
        //                         begin: Alignment.centerLeft,
        //                         end: Alignment.centerRight,
        //                         colors: [Colors.orange, Colors.yellow],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                   vertical: 15,
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Padding(
        //                       padding: EdgeInsets.all(8.0),
        //                       child: Text(
        //                         'Value',
        //                         style: GoogleFonts.josefinSans(
        //                           fontSize: 16,
        //                           color: bottomTextColor,
        //                           fontWeight: FontWeight.w600,
        //                         ),
        //                       ),
        //                     ),
        //                     LinearPercentIndicator(
        //                       percent: 0.4,
        //                       backgroundColor: whiteColor,
        //                       maskFilter: MaskFilter.blur(BlurStyle.solid, 0),
        //                       linearGradient: LinearGradient(
        //                         begin: Alignment.centerLeft,
        //                         end: Alignment.centerRight,
        //                         colors: [Colors.orange, Colors.yellow],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding:
        //             EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: whiteColor,
        //                 border: Border.all(
        //                   color: Colors.white,
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //               ),
        //               padding: EdgeInsets.all(10),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     'Topic Main',
        //                     style: GoogleFonts.josefinSans(
        //                       fontSize: 16,
        //                       color: bottomTextColor,
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(5.0),
        //                     child: Container(
        //                       padding: EdgeInsets.all(20),
        //                       decoration: BoxDecoration(
        //                         color: whiteColor,
        //                         border: Border.all(
        //                           color: Colors.blue,
        //                           width: 1,
        //                           style: BorderStyle.solid,
        //                         ),
        //                         borderRadius: BorderRadius.all(
        //                           Radius.circular(10),
        //                         ),
        //                       ),
        //                       child: Column(
        //                         children: [
        //                           CircularPercentIndicator(
        //                             radius: 100.0,
        //                             lineWidth: 10.0,
        //                             percent: 0.8,
        //                             center: Text(
        //                               'Loading',
        //                               style: GoogleFonts.josefinSans(
        //                                 fontSize: 16,
        //                                 color: bottomTextColor,
        //                                 fontWeight: FontWeight.w600,
        //                               ),
        //                             ),
        //                             circularStrokeCap: CircularStrokeCap.round,
        //                             backgroundColor: whiteColor,
        //                             maskFilter:
        //                                 MaskFilter.blur(BlurStyle.solid, 0),
        //                             linearGradient: LinearGradient(
        //                               begin: Alignment.topCenter,
        //                               end: Alignment.bottomCenter,
        //                               colors: [Colors.orange, Colors.yellow],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: whiteColor,
        //                 border: Border.all(
        //                   color: Colors.white,
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //               ),
        //               padding: EdgeInsets.all(10),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     'Topic Main',
        //                     style: GoogleFonts.josefinSans(
        //                       fontSize: 16,
        //                       color: bottomTextColor,
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(5.0),
        //                     child: Container(
        //                       padding: EdgeInsets.all(20),
        //                       decoration: BoxDecoration(
        //                         color: whiteColor,
        //                         border: Border.all(
        //                           color: Colors.blue,
        //                           width: 1,
        //                           style: BorderStyle.solid,
        //                         ),
        //                         borderRadius: BorderRadius.all(
        //                           Radius.circular(10),
        //                         ),
        //                       ),
        //                       child: Column(
        //                         children: [
        //                           CircularPercentIndicator(
        //                             radius: 100.0,
        //                             lineWidth: 10.0,
        //                             percent: 0.8,
        //                             center: Text(
        //                               'Loading',
        //                               style: GoogleFonts.josefinSans(
        //                                 fontSize: 16,
        //                                 color: bottomTextColor,
        //                                 fontWeight: FontWeight.w600,
        //                               ),
        //                             ),
        //                             circularStrokeCap: CircularStrokeCap.round,
        //                             backgroundColor: whiteColor,
        //                             maskFilter:
        //                                 MaskFilter.blur(BlurStyle.solid, 0),
        //                             linearGradient: LinearGradient(
        //                               begin: Alignment.topCenter,
        //                               end: Alignment.bottomCenter,
        //                               colors: [Colors.orange, Colors.yellow],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Column(
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
                          ? MediaQuery.of(context).size.height * 0.68
                          : MediaQuery.of(context).size.height * 0.969,
                      child: FlutterMap(
                        options: new MapOptions(
                          center: LatLng(userLat, userLong),
                          zoom: 16.0,
                        ),
                        layers: [
                          new TileLayerOptions(
                            urlTemplate:
                                "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
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
                                  color: darkFadeTextColor,
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
                                  color: mainTextColor,
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
                                                style: GoogleFonts.openSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
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
                isExpanded
                    ? SizedBox(
                        height: 25,
                      )
                    : Container(),
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
            color: slideCardColor,
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
                        color: darkFadeTextColor,
                        thickness: 0.5,
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
                          color: darkFadeTextColor,
                          thickness: 0.5,
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
            color: slideCardColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
