import 'package:flutter/material.dart';

class EditPageScreen extends StatefulWidget {
  EditPageScreen({
    @required this.name,
    @required this.url,
    @required this.inputType,
  });
  final String name;
  final String url;
  final TextInputType inputType;
  @override
  _EditPageScreenState createState() => _EditPageScreenState();
}

class _EditPageScreenState extends State<EditPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Room Settings',
            style: TextStyle(
              fontFamily: 'Bambino',
              letterSpacing: 0.5,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Column(),
        ),
      ),
    );
  }
}
