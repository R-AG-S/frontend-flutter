import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';

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
                'New Here?',
                style: TextStyle(
                  fontFamily: 'Bambino',
                  fontSize: ScreenUtil().setSp(90),
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  '''Create or Join to Continue''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w400,
                    color: mainTextColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(36),
                    ),
                    child: ButtonTheme(
                      minWidth: ScreenUtil().setWidth(1080),
                      height: ScreenUtil().setHeight(150),
                      child: RaisedButton(
                        onPressed: () {},
                        color: whiteColor,
                        child: Text(
                          'Create Room',
                          style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(48),
                            color: darkFadeTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(36),
                    ),
                    child: ButtonTheme(
                      minWidth: ScreenUtil().setWidth(1080),
                      height: ScreenUtil().setHeight(150),
                      child: RaisedButton(
                        onPressed: () {},
                        color: whiteColor,
                        child: Text(
                          'join Room',
                          style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(48),
                            color: darkFadeTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
