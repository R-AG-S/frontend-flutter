import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/screens/editpage.dart';
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
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: darkFadeTextColor),
        primaryTextTheme: Typography.material2018().black,
        textTheme: Typography.material2018().black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryTextTheme: Typography.material2018().white,
        textTheme: Typography.material2018().white,
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
        elevation: 0,
        title: Text(
          'Room Settings',
          style: TextStyle(
            fontFamily: 'Bambino',
            letterSpacing: 0.5,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'General',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                onPressed: (value) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => EditPageScreen(
                        name: 'Description',
                        url: null,
                        value: 'Description',
                        inputType: TextInputType.name,
                      ),
                    ),
                  );
                },
                title: 'Add Description',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                ),
                leading: Icon(
                  FontAwesomeIcons.penNib,
                  size: 18,
                ),
              ),
              SettingsTile(
                title: 'Edit Fuel Price',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                ),
                leading: Icon(
                  FontAwesomeIcons.carAlt,
                  size: 18,
                ),
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                onPressed: (value) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => EditPageScreen(
                        name: 'Room Code',
                        url: null,
                        value: 'Room Code',
                        inputType: TextInputType.name,
                      ),
                    ),
                  );
                },
                title: 'Exit Room',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                ),
                leading: Icon(Icons.exit_to_app),
              ),
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                ),
                enabled: notificationsEnabled,
                leading: Icon(Icons.notifications_active),
                switchValue: true,
                onToggle: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
