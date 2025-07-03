import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Connect to Firebase Auth emulator on localhost:9099
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // Connect to Firestore emulator on localhost:8080
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

  runApp(const App());
}
