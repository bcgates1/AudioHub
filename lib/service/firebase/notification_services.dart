import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationServices {
  static final FirebaseMessaging _firebaseCloudMessaging = FirebaseMessaging.instance;

  static getDeviceToken() async {
    await FirebaseMessaging.instance.requestPermission(provisional: true);

    String? deviceToken = await _firebaseCloudMessaging.getToken();
    if (deviceToken != null) {
      FirebaseFirestore.instance.collection('users').doc(FetchDataFirebase().uid).update(
        {
          'deviceToken': deviceToken,
        },
      );
    }
  }
}
