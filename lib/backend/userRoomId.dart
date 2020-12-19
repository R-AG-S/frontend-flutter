import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

userRoomId() async {
  try {
    final authKey = await refreshToken();
    final userRoomId = await http.get(
      'https://payup-backend.herokuapp.com/users/get_user_data/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(userRoomId.body));
  } catch (e) {}
}
