import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

getCarData() async {
  try {
    final authKey = await refreshToken();
    final carData = await http.get(
      'https://payup-backend.herokuapp.com/users/get_car_details/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    return (json.decode(carData.body)['cars']);
  } catch (e) {
    return {};
  }
}
