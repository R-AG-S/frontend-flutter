import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';
import 'package:payup/integration/refresh.dart';

getUserData() async {
  try {
    final authKey = await refreshToken();
    final userDetails = await http.get(
      'https://payup-backend.herokuapp.com/users/get_user_data/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(userDetails.body));
  } catch (e) {}
}
