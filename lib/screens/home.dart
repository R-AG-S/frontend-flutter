import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payup/utilities/constants.dart';

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
          appBar: AppBar(),
          backgroundColor: whiteColor,
          body: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text('3'),
              foregroundColor: Colors.white,
            ),
            title: Text('Tile n°3'),
            subtitle: Text('SlidableDrawerDelegate'),
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
          SlideAction(
            child: Container(
              constraints: BoxConstraints(
                minWidth: 250,
              ),
              width: 250,
              color: slideCardColor,
              padding: EdgeInsets.all(5),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 250,
                ),
                width: 250,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('Room Name'),
                    iconTheme: IconThemeData(color: whiteColor),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 5,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(_createRoute());
                          },
                          child: Icon(
                            FontAwesomeIcons.ellipsisV,
                            color: mainTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            color: whiteColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
