import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

getUserData(String userId) async {
  try {
    final authKey = await refreshToken();
    final userDetails = await http.get(
      'https://payup-backend.herokuapp.com/users/get_any_user_display_data/$userId',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    return ({
      'name': jsonDecode(userDetails.body)['displayname'],
      'dp': jsonDecode(userDetails.body)['displaypic'],
    });
  } catch (e) {
    return {};
  }
}
