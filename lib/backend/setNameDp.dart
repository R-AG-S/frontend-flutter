import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

joinRoom(String roomId) async {
  try {
    final authKey = await refreshToken();
    final joinRoom = await http.post(
      'https://payup-backend.herokuapp.com/users/set_name_and_pic/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, String>{"displayname": "string", "displaypic": "string"},
      ),
    );
    return (joinRoom.statusCode);
  } catch (e) {}
}
