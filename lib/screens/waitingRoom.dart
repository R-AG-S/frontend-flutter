import 'package:flutter/material.dart';
import 'package:payup/backend/userRoomId.dart';
import 'package:payup/screens/home.dart';
import 'package:payup/screens/room.dart';
import 'package:payup/utilities/constants.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void initState() {
    super.initState();
    final userIdList = userRoomId();
    if (userIdList.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RoomOptions(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
        canvasColor: Color(0xFFEFEFF4),
        iconTheme: IconThemeData(color: darkFadeTextColor),
        primaryTextTheme: Typography.material2018().black,
        textTheme: Typography.material2018().black,
      ),
      darkTheme: ThemeData(
        primarySwatch: black,
        accentColor: black,
        brightness: Brightness.dark,
        canvasColor: mainTextColor,
        primaryTextTheme: Typography.material2018().white,
        textTheme: Typography.material2018().white,
      ),
      home: SafeArea(
        child: Scaffold(),
      ),
    );
  }
}
