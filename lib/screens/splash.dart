import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: mainTextColor,
          child: Center(
            child: Text(
              'MECL',
              style: TextStyle(
                fontFamily: 'Bambino',
                letterSpacing: 0.5,
                fontSize: ScreenUtil().setSp(90),
                color: mainBgColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
