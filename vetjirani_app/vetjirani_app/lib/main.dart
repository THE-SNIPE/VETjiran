import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'role_selection_screen.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Connect to Firebase Auth emulator on localhost:9099
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // Connect to Firestore emulator on localhost:8080
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

  runApp(const App());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF122118),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'VetJirani',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -0.015,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Connecting Farmers & Vets Seamlessly',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCfYx5Fh5XCJ7qTCtzKohPsO8B0_I0v3NUtCM94taufNEIge6Z9EA2TKMA400Cj755XoLARbGnr2snbOPvsdXLxp-08XCICfnHgqStowUiv4PMvSsO6oIot5I1EIQJdFlDTXrrAWLrm5nn8UjDejULccfAAiUcJlYxOpej6sK-LWFE1vQZmgJ8M91I8gd8SMlpBg3VkV-zzQQma1C8T5GjGQA6UTQR0lHxHr-6JqUbz1lW-Fps8_mp_DxPkwAZa4NoMNSMu09r6jfs',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
          );
        },
        backgroundColor: const Color(0xFF39E079),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
