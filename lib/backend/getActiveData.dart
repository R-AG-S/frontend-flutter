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
    List passenger = json.decode(getActiveData.body)['passengers_in_car'];
    passenger.add(json.decode(getActiveData.body)['driver']);
    print(passenger);
    return (passenger);
  } catch (e) {
    return [];
  }
}
