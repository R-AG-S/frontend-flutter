import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payup/integration/refresh.dart';

createRoom() {
  try {
    final authKey = await refreshToken();
  } catch (e) {}
}
