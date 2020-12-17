import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/screens/login.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/widgets/textform.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

bool isWaiting = false;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _userNameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
GlobalKey<ScaffoldState> _registerSaffoldKey = GlobalKey();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1080, 2400), allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
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
              color: fadeTextColor,
            ),
            backgroundColor: whiteColor,
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
                                  color: mainTextColor,
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
                                    color: mainTextColor,
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
                                          'ACCOUNT INFORMATION',
                                          style: GoogleFonts.openSans(
                                            color: darkFadeTextColor,
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
                                            hint: 'Name',
                                            firstNameController:
                                                _nameController,
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
                                            hint: 'Email',
                                            firstNameController:
                                                _emailController,
                                            type: TextInputType.emailAddress,
                                            obscure: false,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                ScreenUtil().setHeight(24),
                                          ),
                                          child: TextFormWidget(
                                            hint: 'Username',
                                            firstNameController:
                                                _userNameController,
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
                                            hint: 'Phone Number',
                                            firstNameController:
                                                _phoneController,
                                            type: TextInputType.phone,
                                            obscure: false,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                ScreenUtil().setHeight(24),
                                          ),
                                          child: TextFormWidget(
                                            hint: 'Password',
                                            firstNameController:
                                                _passwordController,
                                            type: TextInputType.visiblePassword,
                                            obscure: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SignInButton(
                                    Buttons.Google,
                                    padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(22.5),
                                      horizontal: ScreenUtil().setWidth(235),
                                    ),
                                    text: "Sign in with Google",
                                    onPressed: () {
                                      // Navigator.pushNamed(context, 'profile');
                                    },
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
                                                height:
                                                    ScreenUtil().setHeight(120),
                                                width:
                                                    ScreenUtil().setWidth(120),
                                                padding: EdgeInsets.all(8),
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(mainTextColor),
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
                                                print(
                                                  _emailController.text +
                                                      _passwordController.text +
                                                      _nameController.text,
                                                );
                                                final response =
                                                    await http.post(
                                                  'https://payup-backend.herokuapp.com/users/register/',
                                                  headers: <String, String>{
                                                    'Content-type':
                                                        'application/json',
                                                    'Accept':
                                                        'application/json',
                                                    // "Authorization": "Some token"
                                                  },
                                                  body: json.encode(
                                                    <String, String>{
                                                      "email":
                                                          _emailController.text,
                                                      "password":
                                                          _passwordController
                                                              .text,
                                                      "username":
                                                          _userNameController
                                                              .text,
                                                      "full_name":
                                                          _nameController.text,
                                                      "phone_number": _phoneController
                                                                  .text
                                                                  .toString()
                                                                  .substring(
                                                                      0, 3) ==
                                                              '+91'
                                                          ? _phoneController
                                                              .text
                                                          : _phoneController
                                                                      .text
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          2) ==
                                                                  '91'
                                                              ? '+' +
                                                                  _phoneController
                                                                      .text
                                                              : '+91' +
                                                                  _phoneController
                                                                      .text
                                                    },
                                                  ),
                                                );
                                                print(
                                                  response.statusCode,
                                                );
                                                print(
                                                  response.body,
                                                );
                                                if (response.statusCode ==
                                                    200) {
                                                  _registerSaffoldKey
                                                      .currentState
                                                      .showSnackBar(SnackBar(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                            vertical:
                                                                ScreenUtil()
                                                                    .setHeight(
                                                                        15),
                                                            horizontal:
                                                                ScreenUtil()
                                                                    .setWidth(
                                                                        15),
                                                          ),
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              redColor,
                                                          content: Text(
                                                            'An error occurred. Please try again later.',
                                                            style: TextStyle(
                                                                color:
                                                                    mainBgColor),
                                                          ),
                                                          duration: Duration(
                                                              seconds: 3)));
                                                } else if (response
                                                        .statusCode ==
                                                    400) {
                                                  _registerSaffoldKey
                                                      .currentState
                                                      .showSnackBar(SnackBar(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                            vertical:
                                                                ScreenUtil()
                                                                    .setHeight(
                                                                        15),
                                                            horizontal:
                                                                ScreenUtil()
                                                                    .setWidth(
                                                                        15),
                                                          ),
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              redColor,
                                                          content: Text(
                                                            'An error occurred. Please try again later.',
                                                            style: TextStyle(
                                                                color:
                                                                    mainBgColor),
                                                          ),
                                                          duration: Duration(
                                                              seconds: 3)));
                                                } else if (response
                                                        .statusCode ==
                                                    409) {
                                                  _registerSaffoldKey
                                                      .currentState
                                                      .showSnackBar(
                                                    SnackBar(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        vertical: ScreenUtil()
                                                            .setHeight(15),
                                                        horizontal: ScreenUtil()
                                                            .setWidth(15),
                                                      ),
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor: redColor,
                                                      content: Text(
                                                        'An error occurred. Please try again later.',
                                                        style: TextStyle(
                                                            color: mainBgColor),
                                                      ),
                                                      duration: Duration(
                                                        seconds: 3,
                                                      ),
                                                    ),
                                                  );
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(
                            200,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Already have an account?  ''',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: ScreenUtil().setSp(38),
                                fontWeight: FontWeight.w400,
                                color: mainTextColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  CupertinoPageRoute<bool>(
                                    builder: (BuildContext context) =>
                                        LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                '''Log in''',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: ScreenUtil().setSp(38),
                                  fontWeight: FontWeight.w400,
                                  color: redColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
