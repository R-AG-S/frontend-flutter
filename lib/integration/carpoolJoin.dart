import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/integration/refresh.dart';

joinRoom() async {
  try {
    final authKey = await refreshToken();
    final refreshBody = await http.get(
      'https://payup-backend.herokuapp.com/users/get_user_data/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(refreshBody.body));
  } catch (e) {}
}
