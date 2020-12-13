import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:latlong/latlong.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

double userLat = 0.0;
double userLong = 0.0;

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
        child: Scaffold(
          extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   leading:
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   iconTheme: IconThemeData(color: whiteColor),
          //   actions: [
          //
          //   ],
          // ),
          backgroundColor: whiteColor,
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
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: FlutterMap(
                      options: new MapOptions(
                        center: LatLng(userLat, userLong),
                        zoom: 15.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                          urlTemplate:
                              "https://b.tile.openstreetmap.org/{z}/{x}/{y}.png",
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(_createRoute());
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: whiteColor,
                                child: Icon(
                                  FontAwesomeIcons.play,
                                  size: 22,
                                  color: mainTextColor,
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
                                // Navigator.of(context).push(_createRoute());
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: whiteColor,
                                child: Icon(
                                  FontAwesomeIcons.shareAlt,
                                  color: mainTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: whiteColor,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/id/${index + 30}/300/300',
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'User ${index + 30}',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: mainTextColor,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: mainTextColor,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.vertical(),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 25,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    border: Border.all(
                      color: Colors.green[700],
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Check Stats',
                      style: TextStyle(
                        fontSize: 18,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          SlideAction(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 20,
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
