import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> refreshToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    final refreshToken = prefs.getString('refreshToken');
    print(refreshToken);
    final refreshBody = await http.post(
      'https://payup-backend.herokuapp.com/users/refresh_token/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(
        <String, String>{"refreshToken": refreshToken},
      ),
    );
    print(jsonDecode(refreshBody.body)['access_token']);
  } catch (e) {}
}
