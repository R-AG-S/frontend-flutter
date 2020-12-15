import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payup/utilities/constants.dart';

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
      ),
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // _showPicker(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/inout-776aa.appspot.com/o/avatar-png%2F63.png?alt=media&token=bbd3fdc4-f800-4ee9-ac58-173a395dbfa8',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        // child: _image != null
                        //     ? ClipRRect(
                        //         borderRadius: BorderRadius.circular(50),
                        //         child: Image.file(
                        //           _image,
                        //           width: 100,
                        //           height: 100,
                        //           fit: BoxFit.fitHeight,
                        //         ),
                        //       )
                        //     : userImage == null
                        //         ? Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.grey[200],
                        //                 borderRadius: BorderRadius.circular(50)),
                        //             width: 100,
                        //             height: 100,
                        //             child: Icon(
                        //               Icons.camera_alt,
                        //               color: Colors.grey[800],
                        //             ),
                        //           )
                        //         : ClipRRect(
                        //             borderRadius: BorderRadius.circular(50),
                        //             child: Image.network(
                        //               userImage,
                        //               width: 100,
                        //               height: 100,
                        //               fit: BoxFit.fitHeight,
                        //             ),
                        //           ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Change Profile Pic",
                      style: TextStyle(
                        color: darkFadeTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.250),
              child: Tabbar(
                userId: 'userID',
                userMail: 'user@gmail.com',
                userName: 'User Name',
                userNumber: 91233445654,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tabbar extends StatefulWidget {
  const Tabbar({
    @required this.userMail,
    @required this.userName,
    @required this.userNumber,
    @required this.userId,
  });
  final String userName;
  final String userMail;
  final int userNumber;
  final String userId;
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          // backgroundColor: bottomContainerColor,
          appBar: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            // labelColor: buttonBgColor,
            unselectedLabelColor: darkFadeTextColor,
            // indicatorColor: buttonBgColor,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Profile Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Account Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  // color: bottomContainerColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 25,
                          left: 25,
                          right: 25,
                        ),
                        child: TextFormField(
                          // controller: _bioController,
                          onChanged: (value) {
                            setState(() {
                              // userBio = value;
                            });
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: mainBgColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: darkFadeTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            labelText: 'Bio',
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                            left: 25,
                            right: 25,
                          ),
                          child: TextFormField(
                            enabled: false,
                            initialValue: widget.userId,
                            style: TextStyle(
                              fontSize: 16,
                              color: mainBgColor,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: darkFadeTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              border: InputBorder.none,
                              labelText: 'Username',
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 25,
                          left: 25,
                          right: 25,
                        ),
                        child: TextFormField(
                          // controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              // userPassword = value;
                            });
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: mainBgColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: darkFadeTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            labelText: 'Enter Password',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 25,
                          left: 25,
                          right: 25,
                        ),
                        child: TextFormField(
                          // controller: _confirmController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onEditingComplete: () {},
                          style: TextStyle(
                            fontSize: 16,
                            color: mainBgColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: darkFadeTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25,
                        left: 25,
                        right: 25,
                      ),
                      child: TextFormField(
                        enabled: false,
                        initialValue: widget.userName,
                        style: TextStyle(
                          fontSize: 16,
                          color: mainBgColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: darkFadeTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                          labelText: 'Full Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25,
                        left: 25,
                        right: 25,
                      ),
                      child: TextFormField(
                        enabled: false,
                        initialValue: widget.userMail,
                        style: TextStyle(
                          fontSize: 16,
                          color: mainBgColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: darkFadeTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25,
                        left: 25,
                        right: 25,
                      ),
                      child: TextFormField(
                        enabled: false,
                        initialValue: widget.userNumber.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: mainBgColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: darkFadeTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
