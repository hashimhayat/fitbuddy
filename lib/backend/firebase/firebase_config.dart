import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBvF9TB6HXT30CBOPb5YtZppbTPdokoT5M",
            authDomain: "fitbuddy-ct.firebaseapp.com",
            projectId: "fitbuddy-ct",
            storageBucket: "fitbuddy-ct.appspot.com",
            messagingSenderId: "48121196756",
            appId: "1:48121196756:web:616e1a7c6cbb9f9557cb41",
            measurementId: "G-MFLXFCBGDH"));
  } else {
    await Firebase.initializeApp();
  }
}
