import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          'Settings',
          style: TextStyle(
            fontFamily: 'Bambino',
            letterSpacing: 0.5,
            fontSize: 22,
            color: mainBgColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Account',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              color: mainBgColor,
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                title: 'Log out',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: mainBgColor,
                ),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  try {
                    bool isLogged = prefs.getBool('isLogged');
                    if (isLogged) {
                      prefs.setBool('isLogged', false);
                      prefs.setString('mail', null);
                      prefs.setString('pass', null);
                      Navigator.of(context).pushNamed('login');
                    }
                  } catch (e) {
                    print(e);
                    print("Error\n");
                  }
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            titleTextStyle: TextStyle(
              fontFamily: 'Bambino',
              fontSize: ScreenUtil().setSp(40),
              color: mainBgColor,
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => UpdatePassword(),
                    ),
                  );
                },
                title: 'Change password',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: mainBgColor,
                ),
                leading: Icon(Icons.exit_to_app),
              ),
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: mainBgColor,
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
              color: mainBgColor,
              fontWeight: FontWeight.w400,
            ),
            tiles: [
              SettingsTile(
                  title: 'Terms of Service',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                    color: mainBgColor,
                  ),
                  leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'About',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                    color: mainBgColor,
                  ),
                  leading: Icon(Icons.info_outline_rounded)),
            ],
          ),
          // CustomSection(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         'images/settings.png',
          //         height: 25,
          //         width: 25,
          //         color: Color(0xFF777777),
          //       ),
          //       SizedBox(
          //         width: 15,
          //       ),
          //       Text(
          //         'Version: 2.4.0',
          //         style: TextStyle(color: Color(0xFF777777)),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
