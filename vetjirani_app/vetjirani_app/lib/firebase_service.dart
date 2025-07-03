import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final FirebaseFunctions functions = FirebaseFunctions.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Add the missing verifyVetMedicalId method
  Future<bool> verifyVetMedicalId(String medicalId) async {
    try {
      final HttpsCallable callable = functions.httpsCallable('verifyVetMedicalId');
      final response = await callable.call(<String, dynamic>{
        'medicalId': medicalId,
      });
      return response.data['isValid'] as bool;
    } catch (e) {
      print('Error verifying vet medical ID: $e');
      return false;
    }
  }

  // Sign in with Google
  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null; // User cancelled the sign-in
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Google sign-in error: $e');
      return null;
    }
  }

  // Sign in anonymously
  static Future<User?> signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print('Anonymous sign-in error: $e');
      return null;
    }
  }

  // Sign up with email and password
  static Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Email sign-up error: $e');
      return null;
    }
  }

  // Sign in with email and password
  static Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Email sign-in error: $e');
      return null;
    }
  }
}
