import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> getFCMToken() async {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.configure();
  String tokenKey = '';
  await _firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    final _homeScreenText = "Push Messaging token: $token";
    print(_homeScreenText);
    tokenKey = token;
  });
  return (tokenKey);
}
