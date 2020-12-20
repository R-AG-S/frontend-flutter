import 'package:firebase_messaging/firebase_messaging.dart';

getFCMToken() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.configure();
  _firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    final _homeScreenText = "Push Messaging token: $token";
    print(_homeScreenText);
    return (token);
  });
}
