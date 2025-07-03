import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Send text message
  Future<void> sendTextMessage(String chatId, String senderId, String message) async {
    await _firestore.collection('chats').doc(chatId).collection('messages').add({
      'senderId': senderId,
      'message': message,
      'type': 'text',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Send image message
  Future<void> sendImageMessage(String chatId, String senderId, XFile imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('chat_images').child(fileName);
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();

    await _firestore.collection('chats').doc(chatId).collection('messages').add({
      'senderId': senderId,
      'imageUrl': imageUrl,
      'type': 'image',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get chat messages stream
  Stream<QuerySnapshot> getChatMessagesStream(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
