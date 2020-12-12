import 'package:flutter/material.dart';

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
  child: Container(
    color: Colors.white,
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigoAccent,
        child: Text('$3'),
        foregroundColor: Colors.white,
      ),
      title: Text('Tile n°$3'),
      subtitle: Text('SlidableDrawerDelegate'),
    ),
  ),
  actions: <Widget>[
    IconSlideAction(
      caption: 'Archive',
      color: Colors.blue,
      icon: Icons.archive,
      onTap: () => _showSnackBar('Archive'),
    ),
    IconSlideAction(
      caption: 'Share',
      color: Colors.indigo,
      icon: Icons.share,
      onTap: () => _showSnackBar('Share'),
    ),
  ],
  secondaryActions: <Widget>[
    IconSlideAction(
      caption: 'More',
      color: Colors.black45,
      icon: Icons.more_horiz,
      onTap: () => _showSnackBar('More'),
    ),
    IconSlideAction(
      caption: 'Delete',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => _showSnackBar('Delete'),
    ),
  ],
);
    );
  }
}
