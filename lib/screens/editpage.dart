import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: darkFadeTextColor),
        primaryTextTheme: Typography.material2018().black,
        textTheme: Typography.material2018().black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: mainTextColor,
        primaryTextTheme: Typography.material2018().white,
        textTheme: Typography.material2018().white,
      ),
      home: SafeArea(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextField(
                    // style: TextStyle(color: mainTextColor),
                    // cursorColor: mainTextColor,
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
                      counterText: '',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: ButtonTheme(
                    buttonColor: Colors.greenAccent[400],
                    focusColor: Colors.greenAccent[400],
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.greenAccent[400],
                      child: Text(
                        'Save',
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
