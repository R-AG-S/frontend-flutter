import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1080, 2400), allowFontScaling: false);
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Room Settings',
          style: TextStyle(
            fontFamily: 'Bambino',
            letterSpacing: 0.5,
            fontSize: 22,
            color: whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Room Settings',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              color: whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          // SettingsSection(
          //   title: 'Account',
          //   titleTextStyle: TextStyle(
          //     fontFamily: 'Bambino',
          //     fontSize: ScreenUtil().setSp(40),
          //     color: whiteColor,
          //     fontWeight: FontWeight.w400,
          //   ),
          //   tiles: [
          //     SettingsTile(
          //       title: 'Log out',
          //       titleTextStyle: GoogleFonts.openSans(
          //         fontSize: ScreenUtil().setSp(45),
          //         fontWeight: FontWeight.w600,
          //         color: whiteColor,
          //       ),
          //       leading: Icon(Icons.exit_to_app),
          //     ),
          //   ],
          // ),
          SettingsSection(
            title: 'Security',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              color: whiteColor,
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                title: 'Change password',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
                leading: Icon(Icons.exit_to_app),
              ),
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
                enabled: notificationsEnabled,
                leading: Icon(Icons.notifications_active),
                switchValue: true,
                onToggle: (value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              color: whiteColor,
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                  title: 'Terms of Service',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'About',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  leading: Icon(Icons.info_outline_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}
