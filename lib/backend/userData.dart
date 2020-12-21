import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

findUserData(String userId) async {
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
    final response = await http.get(
      'https://payup-backend.herokuapp.com/users/get_any_user_display_data/$userId',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
    );
    return ({
      'localId': jsonDecode(userDetails.body)['localId'],
      'name': jsonDecode(response.body)['displayName'],
      'dp': jsonDecode(response.body)['displaypic'],
    });
  } catch (e) {
    return 'Unknown';
  }
}
