import 'package:flutter/material.dart';
import 'package:payup/utilities/constants.dart';

class EditPageScreen extends StatefulWidget {
  EditPageScreen({
    @required this.name,
    @required this.url,
    @required this.value,
    @required this.inputType,
  });
  final String name;
  final String value;
  final String url;
  final TextInputType inputType;
  @override
  _EditPageScreenState createState() => _EditPageScreenState();
}

class _EditPageScreenState extends State<EditPageScreen> {
  final TextEditingController _editController = TextEditingController();
  @override
  void initState() {
    _editController.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Edit ' + widget.name,
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
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: TextField(
                  style: TextStyle(color: mainTextColor),
                  cursorColor: mainTextColor,
                  controller: _editController,
                  keyboardType: widget.inputType,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: widget.value,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    filled: true,
                    fillColor: cardColor,
                    counterText: '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
