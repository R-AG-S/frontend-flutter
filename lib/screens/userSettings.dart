import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
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
      home: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SettingsList(
              shrinkWrap: true,
              sections: [
                SettingsSection(
                  title: 'General',
                  titleTextStyle: TextStyle(
                    fontFamily: 'Bambino',
                    fontSize: ScreenUtil().setSp(40),
                    color: whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                  tiles: [
                    SettingsTile(
                      title: 'Add Description',
                      titleTextStyle: GoogleFonts.openSans(
                        fontSize: ScreenUtil().setSp(45),
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                      leading: Icon(
                        FontAwesomeIcons.penNib,
                        size: 18,
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
              ],
            ),
          ],
        ),
      ),
    );
    //                  Scaffold(
    //     body: Stack(
    //       children: [
    //         SingleChildScrollView(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Center(
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     // _showPicker(context);
    //                   },
    //                   child: Padding(
    //                     padding: EdgeInsets.only(top: 50),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(50),
    //                       child: Image.network(
    //                         'https://firebasestorage.googleapis.com/v0/b/inout-776aa.appspot.com/o/avatar-png%2F63.png?alt=media&token=bbd3fdc4-f800-4ee9-ac58-173a395dbfa8',
    //                         width: 100,
    //                         height: 100,
    //                         fit: BoxFit.fitHeight,
    //                       ),
    //                     ),
    //                     // child: _image != null
    //                     //     ? ClipRRect(
    //                     //         borderRadius: BorderRadius.circular(50),
    //                     //         child: Image.file(
    //                     //           _image,
    //                     //           width: 100,
    //                     //           height: 100,
    //                     //           fit: BoxFit.fitHeight,
    //                     //         ),
    //                     //       )
    //                     //     : userImage == null
    //                     //         ? Container(
    //                     //             decoration: BoxDecoration(
    //                     //                 color: Colors.grey[200],
    //                     //                 borderRadius: BorderRadius.circular(50)),
    //                     //             width: 100,
    //                     //             height: 100,
    //                     //             child: Icon(
    //                     //               Icons.camera_alt,
    //                     //               color: Colors.grey[800],
    //                     //             ),
    //                     //           )
    //                     //         : ClipRRect(
    //                     //             borderRadius: BorderRadius.circular(50),
    //                     //             child: Image.network(
    //                     //               userImage,
    //                     //               width: 100,
    //                     //               height: 100,
    //                     //               fit: BoxFit.fitHeight,
    //                     //             ),
    //                     //           ),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 10),
    //                 child: Text(
    //                   "Change Profile Pic",
    //                   style: TextStyle(
    //                     color: darkFadeTextColor,
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(
    //               top: MediaQuery.of(context).size.height * 0.250),
    //           child: Tabbar(
    //             userId: 'userID',
    //             userMail: 'user@gmail.com',
    //             userName: 'User Name',
    //             userNumber: 91233445654,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
