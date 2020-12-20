import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

getActiveData(String roomId) async {
  try {
    final authKey = await refreshToken();
    final getActiveData = await http.post(
      'https://payup-backend.herokuapp.com/active/get_drive_data',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, dynamic>{"room_id": roomId},
      ),
    );
    return ({
      'pass': json.decode(getActiveData.body)['passengers_in_car'],
      'driver': json.decode(getActiveData.body)['passengers_in_car']
    });
  } catch (e) {
    return {};
  }
}
