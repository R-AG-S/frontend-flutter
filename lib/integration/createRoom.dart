import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/integration/refresh.dart';

createRoom(String name, String details, String fuel) async {
  try {
    final authKey = await refreshToken();
    final response = await http.post(
      'https://payup-backend.herokuapp.com/carpool/create_room',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, String>{
          "room_name": name,
          "details": details,
          "petrol_price": fuel
        },
      ),
    );
    print(
      jsonDecode(response.body),
    );
    final qrCode = jsonDecode(response.body)['ROOM_ID'];
    return qrCode;
  } catch (e) {
    return 'Error';
  }
}
