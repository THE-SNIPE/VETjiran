import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Users collection reference
  static CollectionReference get users => _firestore.collection('users');

  // Appointments collection reference
  static CollectionReference get appointments => _firestore.collection('appointments');

  // Chats collection reference
  static CollectionReference get chats => _firestore.collection('chats');

  // Knowledge Hub collection reference
  static CollectionReference get knowledgeHub => _firestore.collection('knowledgeHub');

  // Add or update user profile
  static Future<void> setUserProfile(String uid, Map<String, dynamic> data) async {
    await users.doc(uid).set(data, SetOptions(merge: true));
  }

  // Get user profile stream
  static Stream<DocumentSnapshot> getUserProfileStream(String uid) {
    return users.doc(uid).snapshots();
  }

  // Add appointment
  static Future<void> addAppointment(Map<String, dynamic> data) async {
    await appointments.add(data);
  }

  // Get appointments stream for user
  static Stream<QuerySnapshot> getAppointmentsStream(String userId, bool isVet) {
    if (isVet) {
      return appointments.where('vetId', isEqualTo: userId).snapshots();
    } else {
      return appointments.where('farmerId', isEqualTo: userId).snapshots();
    }
  }

  // Add chat message
  static Future<void> addChatMessage(String chatId, Map<String, dynamic> message) async {
    await chats.doc(chatId).collection('messages').add(message);
  }

  // Get chat messages stream
  static Stream<QuerySnapshot> getChatMessagesStream(String chatId) {
    return chats.doc(chatId).collection('messages').orderBy('timestamp').snapshots();
  }

  // Get knowledge hub content stream
  static Stream<QuerySnapshot> getKnowledgeHubContentStream() {
    return knowledgeHub.orderBy('createdAt', descending: true).snapshots();
  }
}
