import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:latlong/latlong.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.20,
        child: Scaffold(
            appBar: AppBar(
              leading: null,
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              elevation: 0,
              title: Text(
                'Room Name',
                style: GoogleFonts.raleway(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
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
                  FlutterMap(
                    options: new MapOptions(
                      center: LatLng(51.5, -0.09),
                      zoom: 13.0,
                    ),
                    layers: [
                      new TileLayerOptions(
                          urlTemplate:
                              "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],),
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
