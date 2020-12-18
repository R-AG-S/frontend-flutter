import 'dart:convert';
import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/widgets/qr.dart';
import 'package:payup/widgets/refresh.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _detailsController = TextEditingController();
final TextEditingController _fuelController = TextEditingController();

class CreateRoomScreen extends StatefulWidget {
  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: darkFadeTextColor),
        primaryTextTheme: Typography.material2018().black,
        textTheme: Typography.material2018().black,
      ),
      darkTheme: ThemeData(
        primaryColor: black,
        brightness: Brightness.dark,
        canvasColor: mainTextColor,
        primaryTextTheme: Typography.material2018().white,
        textTheme: Typography.material2018().white,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: Text(
              'Create Carpool Room',
              style: TextStyle(
                fontFamily: 'Bambino',
                letterSpacing: 0.5,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        maxLength: 50,
                        decoration: InputDecoration(
                          hintText: 'Name of Room',
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
                        vertical: 8,
                      ),
                      child: TextField(
                        controller: _detailsController,
                        keyboardType: TextInputType.multiline,
                        maxLength: 144,
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
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
                        vertical: 8,
                      ),
                      child: TextField(
                        controller: _fuelController,
                        keyboardType: TextInputType.number,
                        maxLength: 50,
                        decoration: InputDecoration(
                          hintText: 'Fuel Price',
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
                  ],
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
                        'Create Room',
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final result =
                              await InternetAddress.lookup('google.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {
                            try {
                              final authKey = await refreshToken();
                              if (authKey != 'Error') {
                                final response = await http.post(
                                  'https://payup-backend.herokuapp.com/carpool/create_room',
                                  headers: <String, String>{
                                    'Content-type': 'application/json',
                                    'Accept': 'application/json',
                                    "Authorization": authKey
                                  },
                                  body: json.encode(
                                    <String, String>{
                                      "room_name": _nameController.text,
                                      "details": _detailsController.text,
                                      "petrol_price": _fuelController.text
                                    },
                                  ),
                                );
                                print(jsonDecode(response.body));
                                print(response.statusCode);
                                final qrCode =
                                    jsonDecode(response.body)['ROOM_ID'];
                                if (response.statusCode == 200) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          QRScreen(message: null),
                                    ),
                                  );
                                }
                              } else {
                                Flushbar(
                                  backgroundColor: redColor,
                                  title: "Error",
                                  message: 'An error occurred',
                                  duration: Duration(seconds: 3),
                                )..show(context);
                              }
                            } catch (e) {
                              Flushbar(
                                backgroundColor: redColor,
                                title: "Error",
                                message: 'An error occurred',
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          }
                        } catch (e) {
                          Flushbar(
                            backgroundColor: redColor,
                            title: "Error",
                            message: 'An error occurred',
                            duration: Duration(seconds: 3),
                          )..show(context);
                        }
                      },
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
