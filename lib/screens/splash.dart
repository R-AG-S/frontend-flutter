import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payup/backend/refresh.dart';
import 'package:payup/screens/waitingRoom.dart';
import 'package:payup/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() async {
      print('Connected');
      final isReady = await checkReady();
      Timer(Duration(seconds: 3), () {
        if (isReady) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WaitingScreen(),
            ),
          );
        } else {
          Navigator.pushNamed(context, 'login');
        }
      });
      setState(() {});
    });
  }

  Future<bool> checkReady() async {
    final response = await refreshToken();
    if (response == 'Error') {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() async {
      print('Connected');
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, 'login');
        // if (isReady) {
        //   Navigator.pushNamed(context, 'home');
        // } else {
        //   Navigator.pushNamed(context, 'login');
        // }
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFFFFBD35),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 25,
                  ),
                  child: Image(
                    image: AssetImage('images/image.png'),
                  ),
                ),
                Text(
                  'PayUp',
                  style: TextStyle(
                    fontFamily: 'Bambino',
                    fontSize: 35,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
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
