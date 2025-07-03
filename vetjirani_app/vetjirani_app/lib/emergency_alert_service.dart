import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyAlertService {
  final Location _location = Location();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendEmergencyAlert(String userId, String message) async {
    LocationData locationData = await _location.getLocation();

    await _firestore.collection('emergencyAlerts').add({
      'userId': userId,
      'message': message,
      'location': {
        'latitude': locationData.latitude,
        'longitude': locationData.longitude,
      },
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'pending',
    });
  }
}
