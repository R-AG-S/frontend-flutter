import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payup/utilities/constants.dart';

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
          color: mainBgColor,
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
