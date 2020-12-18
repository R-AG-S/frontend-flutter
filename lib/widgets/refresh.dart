import 'package:shared_preferences/shared_preferences.dart';

Future<String> refreshToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
}
