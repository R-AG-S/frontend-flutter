import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

setCarDetails(String carModel, String milege) async {
  try {
    final authKey = await refreshToken();
    final setCarDetails = await http.post(
      'https://payup-backend.herokuapp.com/active/start_drive',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, String>{"car_model": carModel, "mileage": milege},
      ),
    );
    print(jsonDecode(setCarDetails.body));
  } catch (e) {}
}
