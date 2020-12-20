import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

joinRoom(String roomId, double lat, double long) async {
  try {
    final authKey = await refreshToken();
    final joinRoom = await http.post(
      'https://payup-backend.herokuapp.com/active/leave_drive',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, dynamic>{"room_id": roomId, "lat": lat, "lng": long},
      ),
    );
    return (joinRoom.statusCode);
  } catch (e) {
    return 400;
  }
}
