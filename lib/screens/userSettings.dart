import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/utilities/data.dart';
import 'package:settings_ui/settings_ui.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
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
        canvasColor: mainTextColor,
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'User Settings',
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              SettingsList(
                shrinkWrap: true,
                sections: [
                  SettingsSection(
                    title: 'Account Settings',
                    titleTextStyle: TextStyle(
                      fontFamily: 'Bambino',
                      fontSize: ScreenUtil().setSp(40),
                      color: whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                    tiles: [],
                  ),
                ],
              ),
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
                              'https://firebasestorage.googleapis.com/v0/b/inout-776aa.appspot.com/o/avatar-png%2F63.png?alt=media&token=bbd3fdc4-f800-4ee9-ac58-173a395dbfa8',
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
                title: 'Username',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
                leading: Icon(
                  FontAwesomeIcons.penFancy,
                  size: 18,
                ),
              ),
              SettingsTile(
                title: 'Email',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
                leading: Icon(
                  FontAwesomeIcons.solidEnvelope,
                  size: 18,
                ),
              ),
              SettingsTile(
                title: 'Phone',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
                leading: Icon(
                  FontAwesomeIcons.phone,
                  size: 18,
                ),
              ),
              SettingsTile(
                title: 'Change Password',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
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
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SettingsTile(
                title: 'Edit Listed Cars',
                titleTextStyle: GoogleFonts.openSans(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
                leading: Icon(
                  FontAwesomeIcons.carAlt,
                  size: 18,
                ),
              ),
            ],
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
              color: whiteColor,
              child: Column(
                children: [
                  ListTile(
                      leading: new Icon(FontAwesomeIcons.userAlt),
                      title: new Text('Pick Your Avatar'),
                      onTap: () {
                        Navigator.of(context).pop();
                      }),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(iconData.length, (index) {
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: whiteColor,
                          child: FadeInImage.assetNetwork(
                            fadeOutDuration: Duration(seconds: 1),
                            image: iconData[index],
                            placeholder: 'images/place.png',
                            height: 30,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             VideoPage(videoData: videoData)));
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
