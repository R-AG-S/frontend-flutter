import 'dart:convert';
import 'package:device_preview/device_preview.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/screens/register.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/widgets/textform.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool isWaiting = false;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final GlobalKey<ScaffoldState> _loginscaffoldKey = GlobalKey();
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          key: _loginscaffoldKey,
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10.0),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.155, bottom: height * 0.05),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Log In to PayUp',
                        style: GoogleFonts.raleway(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '''Carpool with friends. It's always fun!!!''',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 50,
                              bottom: 8,
                              // left: MediaQuery.of(context).size.width * 0.1,
                              // right: MediaQuery.of(context).size.width * 0.1,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ACCOUNT INFORMATION',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextFormWidget(
                                    hint: 'Email',
                                    firstNameController: _emailController,
                                    type: TextInputType.emailAddress,
                                    obscure: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextFormWidget(
                                    hint: 'Password',
                                    firstNameController: _passwordController,
                                    type: TextInputType.visiblePassword,
                                    obscure: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      CupertinoPageRoute<bool>(
                                        builder: (BuildContext context) =>
                                            SignInScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '''Forgot your password?''',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: blueColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SignInButton(
                            Buttons.Google,
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.15,
                            ),
                            text: "Log in with Google",
                            onPressed: () {
                              // Navigator.pushNamed(context, 'profile');
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: ButtonTheme(
                              minWidth: width,
                              height: 50.0,
                              child: RaisedButton(
                                color: whiteColor,
                                child: isWaiting
                                    ? Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(8),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  mainTextColor),
                                        ),
                                      )
                                    : Text(
                                        'Log In',
                                        style: GoogleFonts.openSans(
                                          fontSize: 18,
                                          color: darkFadeTextColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                onPressed: isWaiting
                                    ? null
                                    : () async {
                                        if (checkStatus()) {
                                          final response = await http.post(
                                            'https://payup-backend.herokuapp.com/users/login/',
                                            headers: <String, String>{
                                              'Content-type':
                                                  'application/json',
                                              'Accept': 'application/json',
                                              // "Authorization": "Some token"
                                            },
                                            body: json.encode(
                                              <String, String>{
                                                "email": _emailController.text,
                                                "password":
                                                    _passwordController.text,
                                              },
                                            ),
                                          );
                                          print(
                                            jsonDecode(
                                                response.body)['refreshToken'],
                                          );
                                          print(response.statusCode);
                                          if (response.statusCode == 200) {
                                            Navigator.pushNamed(
                                                context, 'room');
                                          }
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: height * 0.025,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '''Don't have an account?  ''',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: ScreenUtil().setSp(42),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            CupertinoPageRoute<bool>(
                              builder: (BuildContext context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          '''Sign Up''',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: ScreenUtil().setSp(42),
                            fontWeight: FontWeight.w600,
                            color: redColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool checkStatus() {
    if (_emailController.text.isEmpty && _emailController.text == "") {
      Flushbar(
        backgroundColor: redColor,
        title: "Error",
        message: 'Email should not be empty.',
        duration: Duration(seconds: 3),
      )..show(context);
      return false;
    } else if (_passwordController.text.isEmpty &&
        _passwordController.text == "") {
      Flushbar(
        backgroundColor: redColor,
        title: "Error",
        message: 'Password should not be empty.',
        duration: Duration(seconds: 3),
      )..show(context);
      return false;
    } else if (!(_emailController.text.toString().contains(
          new RegExp(r'@', caseSensitive: true),
        ))) {
      Flushbar(
        backgroundColor: redColor,
        title: "Error",
        message: 'Enter valid email id.',
        duration: Duration(seconds: 3),
      )..show(context);
      return false;
    } else if (_passwordController.text.length < 8) {
      Flushbar(
        backgroundColor: redColor,
        title: "Error",
        message: 'Password too short.',
        duration: Duration(seconds: 3),
      )..show(context);
      return false;
    } else {
      return true;
    }
  }
}
