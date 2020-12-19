import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

userRoomDetails() async {
  try {
    final authKey = await refreshToken();
    final userRoomDetails = await http.get(
      'https://payup-backend.herokuapp.com/carpool/user_rooms/data/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(userRoomDetails.body));
  } catch (e) {}
}
