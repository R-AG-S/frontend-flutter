import 'package:device_preview/device_preview.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/backend/setNameDp.dart';
import 'package:payup/screens/editpage.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/utilities/data.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings extends StatefulWidget {
  UserSettings({
    @required this.dp,
    @required this.username,
  });
  final String username;
  final String dp;
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

String url =
    'https://firebasestorage.googleapis.com/v0/b/inout-776aa.appspot.com/o/avatar-png%2F63.png?alt=media&token=bbd3fdc4-f800-4ee9-ac58-173a395dbfa8';

class _UserSettingsState extends State<UserSettings> {
  @override
  void initState() {
    url = widget.dp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1080, 2400), allowFontScaling: false);
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Color(0xFFEFEFF4),
        iconTheme: IconThemeData(color: darkFadeTextColor),
        primaryTextTheme: Typography.material2018().black,
        textTheme: Typography.material2018().black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: mainTextColor,
        primaryTextTheme: Typography.material2018().white,
        textTheme: Typography.material2018().white,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'User Settings',
              style: TextStyle(
                fontFamily: 'Bambino',
                letterSpacing: 0.5,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15,
                ),
                SettingsTile(
                  title: 'Account Settings',
                  titleTextStyle: TextStyle(
                    fontFamily: 'Bambino',
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // SettingsList(
                //   shrinkWrap: true,
                //   sections: [
                //     SettingsSection(
                //       title: 'Account Settings',
                //       titleTextStyle: TextStyle(
                //         fontFamily: 'Bambino',
                //         fontSize: ScreenUtil().setSp(40),
                //         fontWeight: FontWeight.w400,
                //       ),
                //       tiles: [],
                //     ),
                //   ],
                // ),
                GestureDetector(
                  onTap: () {
                    // _showPicker(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () => _showPicker(context),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: whiteColor,
                            ),
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                url,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 80,
                              left: 80,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainTextColor,
                                  border: Border.all(
                                    color: whiteColor,
                                    width: 2,
                                  )),
                              padding: EdgeInsets.all(
                                10,
                              ),
                              child: Icon(
                                FontAwesomeIcons.solidEdit,
                                color: whiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SettingsTile(
                  onPressed: (value) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EditPageScreen(
                          name: 'Username',
                          url: null,
                          value: 'User Name',
                          inputType: TextInputType.name,
                        ),
                      ),
                    );
                  },
                  title: 'Username',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.penFancy,
                    size: 18,
                  ),
                ),
                SettingsTile(
                  onPressed: (value) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EditPageScreen(
                          name: 'Email',
                          url: null,
                          value: 'Email',
                          inputType: TextInputType.emailAddress,
                        ),
                      ),
                    );
                  },
                  title: 'Email',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.solidEnvelope,
                    size: 18,
                  ),
                ),
                SettingsTile(
                  onPressed: (value) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EditPageScreen(
                          name: 'Phone',
                          url: null,
                          value: 'Phone',
                          inputType: TextInputType.number,
                        ),
                      ),
                    );
                  },
                  title: 'Phone',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    size: 18,
                  ),
                ),
                SettingsTile(
                  // onPressed: (value) {
                  //   Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => EditPageScreen(
                  //         name: 'Username',
                  //         url: null,
                  //         value: 'User Name',
                  //         inputType: TextInputType.name,
                  //       ),
                  //     ),
                  //   );
                  // },
                  title: 'Change Password',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.unlockAlt,
                    size: 18,
                  ),
                ),
                SettingsTile(
                  title: 'General',
                  titleTextStyle: TextStyle(
                    fontFamily: 'Bambino',
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SettingsTile(
                  title: 'Edit Listed Cars',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.carAlt,
                    size: 18,
                  ),
                ),
                SettingsTile(
                  title: 'Security',
                  titleTextStyle: TextStyle(
                    fontFamily: 'Bambino',
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SettingsTile(
                  onPressed: (value) async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    try {
                      prefs.setBool('Logged', false);
                    } catch (e) {
                      Flushbar(
                        backgroundColor: redColor,
                        title: "Error",
                        message: 'An error occurred please try again.',
                        duration: Duration(seconds: 3),
                      )..show(context);
                    }
                    Flushbar(
                      backgroundColor: redColor,
                      title: "Error",
                      message: 'An error occurred please try again.',
                      duration: Duration(seconds: 3),
                    )..show(context);
                  },
                  title: 'Logout',
                  titleTextStyle: GoogleFonts.openSans(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w600,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.signOutAlt,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(5),
              color: whiteColor,
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    ListTile(
                        title: new Text(
                          'Pick Your Avatar',
                          style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(45),
                            fontWeight: FontWeight.w600,
                            color: mainTextColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: mainTextColor,
                          width: 0.25,
                        ),
                      ),
                      child: GridView.count(
                        crossAxisCount: 5,
                        children: List.generate(iconData.length, (index) {
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(
                                  color: mainTextColor,
                                  width: 0.25,
                                ),
                              ),
                              padding: EdgeInsets.all(5),
                              child: FadeInImage.assetNetwork(
                                fadeOutDuration: Duration(seconds: 1),
                                image: iconData[index],
                                placeholder: 'images/place.png',
                                height: 25,
                              ),
                            ),
                            onTap: () async {
                              setState(() {
                                url = iconData[index];
                              });
                              final response =
                                  await setNameDp(widget.username, url);
                              if (response == 200 || response == 201) {
                                Navigator.of(context).pop();
                              } else {
                                Flushbar(
                                  backgroundColor: redColor,
                                  title: "Error",
                                  message:
                                      'An error occurred please try again.',
                                  duration: Duration(seconds: 3),
                                )..show(context);
                              }

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             VideoPage(videoData: videoData)));
                            },
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
