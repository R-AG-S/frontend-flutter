import 'package:flutter/material.dart';

class EditPageScreen extends StatefulWidget {
  EditPageScreen({});
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
      child: Scaffold(),
    );
  }
}
