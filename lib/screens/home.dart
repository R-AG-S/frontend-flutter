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

  final SlidableController slidableController = SlidableController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Slidable(
        controller: slidableController,
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.20,
        child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () => Slidable.of(context)?.renderingMode ==
                          SlidableRenderingMode.none
                      ? Slidable.of(context)?.open()
                      : Slidable.of(context)?.close(),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: mainTextColor,
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              elevation: 2,
              title: Text(
                'Room Name',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: mainTextColor,
                ),
              ),
              iconTheme: IconThemeData(color: whiteColor),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(_createRoute());
                    },
                    child: Icon(
                      FontAwesomeIcons.play,
                      size: 22,
                      color: mainTextColor,
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
                    child: Icon(
                      FontAwesomeIcons.rss,
                      color: mainTextColor,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: whiteColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // FlutterMap(
                  //   mapController: _mapController,
                  //   options: MapOptions(
                  //     center: LatLng(
                  //         currentLatLng.latitude, currentLatLng.longitude),
                  //     zoom: 5.0,
                  //   ),
                  //   layers: [
                  //     TileLayerOptions(
                  //       urlTemplate:
                  //           'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  //       subdomains: ['a', 'b', 'c'],
                  //       // For example purposes. It is recommended to use
                  //       // TileProvider with a caching and retry strategy, like
                  //       // NetworkTileProvider or CachedNetworkTileProvider
                  //       tileProvider: NonCachingNetworkTileProvider(),
                  //     ),
                  //     MarkerLayerOptions(markers: markers)
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: 350,
                      alignment: Alignment.centerLeft,
                      child: FlutterMap(
                        options: new MapOptions(
                          center: LatLng(userLat, userLong),
                          zoom: 15.0,
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
                                point: LatLng(51.5, -0.09),
                                builder: (ctx) => new Container(
                                  child: new FlutterLogo(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
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
