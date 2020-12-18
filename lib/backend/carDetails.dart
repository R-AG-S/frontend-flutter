import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/integration/refresh.dart';

getCarDetails() async {
  try {
    final authKey = await refreshToken();
    final carDetails = await http.get(
      'https://payup-backend.herokuapp.com/users/get_car_details/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(carDetails.body));
  } catch (e) {}
}
