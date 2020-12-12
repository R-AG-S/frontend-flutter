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

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final GlobalKey<ScaffoldState> _loginscaffoldKey = GlobalKey();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
              color: mainTextColor,
            ),
            backgroundColor: mainBgColor,
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
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.openSans(
                          color: mainBgColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: TextFormWidget(
                          firstNameController: _emailController,
                          type: TextInputType.emailAddress,
                          obscure: false,
                        ),
                      ),
                      Text(
                        'Password',
                        style: GoogleFonts.openSans(
                          color: mainBgColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: TextFormWidget(
                          firstNameController: _passwordController,
                          type: TextInputType.visiblePassword,
                          obscure: true,
                        ),
                      ),
                    ],
                  )),
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
                          Buttons.Google,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01, horizontal: width * 0.1),
                          text: "Log in with Google",
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile');
                          },
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
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: mainTextColor,
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
