import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/backend/refresh.dart';

setNameDp(String userName, String displayPic) async {
  try {
    final authKey = await refreshToken();
    final setNameDp = await http.post(
      'https://payup-backend.herokuapp.com/users/set_name_and_pic/',
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": authKey
      },
      body: json.encode(
        <String, String>{"displayname": userName, "displaypic": displayPic},
      ),
    );
    return (setNameDp.statusCode);
  } catch (e) {
    return 400;
  }
}
