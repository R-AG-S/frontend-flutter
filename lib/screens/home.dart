import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
        actionExtentRatio: 0.25,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text('3'),
                foregroundColor: Colors.white,
              ),
              title: Text('Tile n°3'),
              subtitle: Text('SlidableDrawerDelegate'),
            ),
          ),
        ),
        actions: <Widget>[
          SlideAction(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.indigoAccent,
                    child: Text(index.toString()),
                    foregroundColor: Colors.white,
                  ),
                );
              },
            ),
            color: lightFadeText,
            onTap: () {},
          ),
          IconSlideAction(
            caption: 'Share',
            color: whiteColor,
            icon: Icons.share,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
