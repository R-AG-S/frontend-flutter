import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payup/utilities/constants.dart';
import 'package:payup/widgets/textform.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

bool isWaiting = false;

class _QRScannerState extends State<QRScanner> {
  final TextEditingController _qrController = TextEditingController();
  String qrCodeResult = "Not Yet Scanned";
  var qrText = '';
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
            title: Text("Scanner"),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildQrView(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: TextFormWidget(
                    hint: 'Enter QR Code',
                    firstNameController: _qrController,
                    type: TextInputType.name,
                    obscure: false,
                  ),
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
                                valueColor: AlwaysStoppedAnimation<Color>(
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
                              setState(() {
                                isWaiting = true;
                              });
                              try {
                                final result =
                                    await InternetAddress.lookup('google.com');
                                if (result.isNotEmpty &&
                                    result[0].rawAddress.isNotEmpty) {
                                  try {
                                    if (_qrController.text.isNotEmpty) {
                                      print(response.statusCode);
                                      if (response.statusCode == 200) {
                                        try {
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          try {
                                            prefs.setString(
                                                'refreshToken',
                                                jsonDecode(response.body)[
                                                    'refreshToken']);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WaitingScreen(),
                                              ),
                                            );
                                          } catch (e) {
                                            setState(() {
                                              isWaiting = false;
                                            });
                                            Flushbar(
                                              backgroundColor: redColor,
                                              title: "Error",
                                              message: 'An error occurred',
                                              duration: Duration(seconds: 3),
                                            )..show(context);
                                          }
                                        } catch (e) {
                                          setState(() {
                                            isWaiting = false;
                                          });
                                          Flushbar(
                                            backgroundColor: redColor,
                                            title: "Error",
                                            message: 'An error occurred',
                                            duration: Duration(seconds: 3),
                                          )..show(context);
                                        }
                                      }
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isWaiting = false;
                                    });
                                    Flushbar(
                                      backgroundColor: redColor,
                                      title: "Error",
                                      message: 'An error occurred',
                                      duration: Duration(seconds: 3),
                                    )..show(context);
                                  }
                                } else {
                                  setState(() {
                                    isWaiting = false;
                                  });
                                  Flushbar(
                                    backgroundColor: redColor,
                                    title: "Error",
                                    message: 'An error occurred',
                                    duration: Duration(seconds: 3),
                                  )..show(context);
                                }
                              } catch (e) {
                                setState(() {
                                  isWaiting = false;
                                });
                                Flushbar(
                                  backgroundColor: redColor,
                                  title: "Error",
                                  message: 'An error occurred',
                                  duration: Duration(seconds: 3),
                                )..show(context);
                              }
                            },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          Future.microtask(() => controller?.updateDimensions(qrKey));
          return false;
        },
        child: Container(
          height: 500,
          child: SizeChangedLayoutNotifier(
            key: const Key('qr-size-notifier'),
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        _qrController.text = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
