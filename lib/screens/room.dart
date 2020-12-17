import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomOptions extends StatefulWidget {
  @override
  _RoomOptionsState createState() => _RoomOptionsState();
}

class _RoomOptionsState extends State<RoomOptions> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1080, 2400), allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFBD35),
        body: Column(
          children: [
            Image.asset(
              'images/car_3.gif',
              fit: BoxFit.fitWidth,
            ),
            Center(
              child: Text(
                'Sign up to PayUp',
                style: GoogleFonts.raleway(
                  fontSize: ScreenUtil().setSp(65),
                  fontWeight: FontWeight.w700,
                  color: mainTextColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '''Car Pool with friends. It's always fun!!!''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.w400,
                    color: mainTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
