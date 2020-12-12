import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
            color: Colors.blue,
            onTap: () {},
          ),
          IconSlideAction(
            caption: 'Share',
            color: Colors.indigo,
            icon: Icons.share,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
