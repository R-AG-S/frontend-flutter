import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

userData() async {
  try {
    final authKey = await refreshToken();
    final userDetails = await http.get(
      'https://payup-backend.herokuapp.com/users/get_any_user_display_data/{user_id}',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    print(jsonDecode(userDetails.body));
  } catch (e) {}
}
