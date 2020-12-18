import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

refreshToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    final refreshToken = prefs.getString('refreshToken');
    print(refreshToken);
    final refreshBody = await http.get(
      'https://payup-backend.herokuapp.com/users/get_user_data/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print(jsonDecode(refreshBody.body));
  } catch (e) {}
}
