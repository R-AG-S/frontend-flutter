import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payup/screens/login.dart';
import 'package:payup/screens/splash.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'splash': (context) => SplashScreen(),
        'login': (context) => LoginScreen(),
      },
    );
  }
}
