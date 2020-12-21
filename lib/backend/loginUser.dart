import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<int> loginUser(String email, String password, String fcm) async {
  try {
    final response = await http.post(
      'https://payup-backend.herokuapp.com/users/login/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(
        <String, String>{
          "email": email,
          "password": password,
          "device_registeration_token": fcm
        },
      ),
    );
    print(
      jsonDecode(response.body),
    );
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString(
          'refreshToken', jsonDecode(response.body)['refreshToken']);
      prefs.setBool('Logged', true);
    } catch (e) {
      return 400;
    }
    return (response.statusCode);
  } catch (e) {
    return 400;
  }
}
