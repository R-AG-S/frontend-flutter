import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/screens/login.dart';
import 'package:payup/utilities/constants.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
              color: fadeTextColor,
            ),
            backgroundColor: mainBgColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.155, bottom: height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      'Sign up to PayUp',
                      style: GoogleFonts.raleway(
                        fontSize: 24,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: mainTextColor,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 50,
                          bottom: 8,
                          left: 8,
                          right: 8,
                        ),
                        child: SignInButton(
                          Buttons.Email,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02, horizontal: width * 0.1),
                          text: "Log in with Email",
                          onPressed: () {
                            Navigator.pushNamed(context, 'email');
                          },
                          elevation: 5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SignInButton(
                          Buttons.Facebook,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02, horizontal: width * 0.1),
                          text: "Log in with Facebook",
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SignInButton(
                          Buttons.Google,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01, horizontal: width * 0.1),
                          text: "Log in with Google",
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SignInButton(
                          Buttons.Twitter,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02, horizontal: width * 0.1),
                          text: "Log in with Twitter",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    EdgeInsets.only(bottom: height * 0.025, top: height * 0.29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Already have an account?  ''',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: mainTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          CupertinoPageRoute<bool>(
                            builder: (BuildContext context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        '''Log in''',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
