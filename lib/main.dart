import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payup/screens/home.dart';
import 'package:payup/screens/login.dart';
import 'package:payup/screens/generalSettings.dart';
import 'package:payup/screens/room.dart';
import 'package:payup/screens/slideup.dart';
import 'package:payup/screens/splash.dart';
import 'package:payup/utilities/fcm.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApp());
  });
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: ${message['data']['message']}");
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'slide': (context) => SlideUpPanel(),
        'settings': (context) => Settings(),
        'details': (context) => PushMessagingExample(),
        'room': (context) => RoomOptions(),
      },
    );
  }
}
