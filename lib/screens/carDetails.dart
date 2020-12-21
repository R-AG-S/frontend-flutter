import 'package:device_preview/device_preview.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/widgets/textform.dart';

class CarDetailsScreen extends StatefulWidget {
  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  bool isWaiting = false;
  GlobalKey<ScaffoldState> _carDataScaffoldKey = GlobalKey();
  final TextEditingController _carController = TextEditingController();
  final TextEditingController _milegeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1080, 2400), allowFontScaling: false);
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
        canvasColor: Color(0xFFEFEFF4),
        iconTheme: IconThemeData(color: darkFadeTextColor),
        primaryTextTheme: Typography.material2018().black,
        textTheme: Typography.material2018().black,
      ),
      darkTheme: ThemeData(
        primarySwatch: black,
        accentColor: black,
        brightness: Brightness.dark,
        canvasColor: mainTextColor,
        primaryTextTheme: Typography.material2018().white,
        textTheme: Typography.material2018().white,
      ),
      home: SafeArea(
        child: Scaffold(
          key: _carDataScaffoldKey,
          floatingActionButton: Padding(
            padding: EdgeInsets.all(ScreenUtil().setHeight(
              30,
            )),
            child: FloatingActionButton(
              mini: true,
              heroTag: "btn1",
              elevation: 0,
              onPressed: () {},
              child: Icon(
                Icons.help_outline_rounded,
                size: 26.0,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: SingleChildScrollView(
            reverse: false,
            child: Container(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom * 0.1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(250),
                            bottom: ScreenUtil().setHeight(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  'Sign up to PayUp',
                                  style: GoogleFonts.raleway(
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w700,
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
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(75),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(125),
                                        bottom: ScreenUtil().setHeight(24),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'CAR INFORMATION',
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              fontSize: ScreenUtil().setSp(35),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(24),
                                            ),
                                            child: TextFormWidget(
                                              hint: 'Car Name',
                                              firstNameController:
                                                  _carController,
                                              type: TextInputType.name,
                                              obscure: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(24),
                                            ),
                                            child: TextFormWidget(
                                              hint: 'Milege Details',
                                              firstNameController:
                                                  _milegeController,
                                              type:
                                                  TextInputType.visiblePassword,
                                              obscure: false,
                                            ),
                                          ),
                                        ],
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
                                          color: whiteColor,
                                          child: isWaiting
                                              ? Container(
                                                  height: ScreenUtil()
                                                      .setHeight(120),
                                                  width: ScreenUtil()
                                                      .setWidth(120),
                                                  padding: EdgeInsets.all(8),
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            mainTextColor),
                                                  ),
                                                )
                                              : Text(
                                                  'Sign In',
                                                  style: GoogleFonts.openSans(
                                                    fontSize:
                                                        ScreenUtil().setSp(48),
                                                    color: darkFadeTextColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                          onPressed: isWaiting
                                              ? null
                                              : () async {
                                                  if (_carController
                                                          .text.isNotEmpty &&
                                                      _milegeController
                                                          .text.isNotEmpty) {
                                                  } else {
                                                    Flushbar(
                                                      backgroundColor: redColor,
                                                      title: "Error",
                                                      message:
                                                          '''Input shouldn't be null.''',
                                                      duration:
                                                          Duration(seconds: 3),
                                                    )..show(context);
                                                  }
                                                },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
