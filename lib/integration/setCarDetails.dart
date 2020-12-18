import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/integration/refresh.dart';

setCarDetails(String carModel, String milege) async {
  try {
    final authKey = await refreshToken();
    final joinRoom = await http.post(
      'https://payup-backend.herokuapp.com/carpool/join_room',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, String>{"car_model": carModel, "mileage": "string"},
      ),
    );
    print(jsonDecode(joinRoom.body));
  } catch (e) {}
}
