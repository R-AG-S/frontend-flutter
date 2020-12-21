import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> loginUser(String email, String password, String fcm) async {
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
          "device_registeration_token": fcmToken
        },
      ),
    );
    print(
      jsonDecode(response.body),
    );
    return (jsonDecode(refreshBody.body)['access_token']);
  } catch (e) {
    return 'Error';
  }
}
