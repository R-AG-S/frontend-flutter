import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

userRoomId() async {
  try {
    final authKey = await refreshToken();
    final userRoomId = await http.get(
      'https://payup-backend.herokuapp.com/carpool/user_rooms/id',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(userRoomId.body)['Rooms']);
  } catch (e) {}
}
