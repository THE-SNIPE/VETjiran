import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add feedback for a vet
  Future<void> addFeedback(String vetId, String userId, int rating, String comment) async {
    await _firestore.collection('vetFeedback').add({
      'vetId': vetId,
      'userId': userId,
      'rating': rating,
      'comment': comment,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get feedback stream for a vet
  Stream<QuerySnapshot> getFeedbackStream(String vetId) {
    return _firestore
        .collection('vetFeedback')
        .where('vetId', isEqualTo: vetId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Calculate average rating for a vet
  Future<double> getAverageRating(String vetId) async {
    final snapshot = await _firestore
        .collection('vetFeedback')
        .where('vetId', isEqualTo: vetId)
        .get();

    if (snapshot.docs.isEmpty) return 0.0;

    double total = 0;
    for (var doc in snapshot.docs) {
      total += (doc['rating'] ?? 0);
    }

    return total / snapshot.docs.length;
  }
}
