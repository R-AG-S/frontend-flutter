import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

endDrive(String roomId, double lat, double long, double distance) async {
  try {
    final authKey = await refreshToken();
    final endDrive = await http.post(
      'https://payup-backend.herokuapp.com/active/end_drive',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, dynamic>{
          "room_id": roomId,
          "lat": lat,
          "lng": long,
          "distance": distance
        },
      ),
    );
  } catch (e) {}
}
