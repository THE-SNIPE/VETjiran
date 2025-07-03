import 'package:flutter/material.dart';

class VetChatScreen extends StatelessWidget {
  const VetChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121714),
        elevation: 0,
        title: const Text(
          "Farmer's Name",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatMessage(
                  isFarmer: true,
                  message:
                      "Hello Dr. Evans, I'm concerned about my cow's health. She's been lethargic and has a reduced appetite. Can you advise?",
                  senderName: "Farmer's Name",
                  imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuDDIm-oTinCCMgj-_Mw7MFr1aCfGpu2e_jchZZEhwWmqHAahm7L4_GuW6s0s_TSnJ4Rk0zlPlipMCTR_C76D2F-m8t6mFtkc3Lp4MhanCZOIOABdXvul-0OKy8ySJ7_CQconvvdAvQYc49caW-SZotefzJS-hnsuCLNKhNRjlgRPBpJY8hFUMJ3-pdWkfm9hm-tDbVKX0ferC2QLexLVwTHl9mqf25wGkJe2WSWZoBbGozSu7xNqNOyrrGQTsm99Pnh7-pLzS_cNFQ",
                ),
                ChatMessage(
                  isFarmer: false,
                  message:
                      "Hi there, I understand your concern. Can you provide more details? Any other symptoms like fever, coughing, or changes in stool?",
                  senderName: "Dr. Evans",
                  imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuCzswZsbJnZwYFaMTgM-dbC5H012c0GwOyAHDsiEOuysA1HNcGab0E2RM-V7RgeUyA1oM9e4Ze5cGTnhQrZPDQLcPIX7JOmZPR1-Is4BlaWW169PnJ8MBvTKpc4P9GYGTQXQ4TSH_HG9_9zJzgm9g7wffA5vMuopEJza1PI7BWDPpBRwY8B3w1pWWZGKxS5sHTt9AMkCqWt2TDTJYxedzQbnFMfEZZ8nOJYBzMHi1I7HZhmW9dXxGzssHonNNSl0mXGFCCCEXm9j_8",
                ),
                ChatMessage(
                  isFarmer: true,
                  message:
                      "No fever or coughing, but her stool is a bit watery. I've attached a photo for your review.",
                  senderName: "Farmer's Name",
                  imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuDaa2SEmeb6F3atJelk8mbw_H04ZZYK_ud2k7IHqzju5jq2z3cbt_1kAWuxlPKJkreOmFeu7fp7muy5wj-Ze8kNRvqwbar_2SBSIfRWx1xtBPA1qbwXXcBKpmNEuDJQNjE7CA1Fm9ZRaB9r-smHuRY87RFb-Bw139BVg2ib3-AKfPvtiHma8tIYTBjarfH2GH83jK0oZiqciUSA2fzWt7BeKE3kz7kmd-yb2WUkbK_UtB9lzaBB6wRRSklE8gxPqnBXQkEFHR18UPk",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a message',
                      hintStyle: const TextStyle(color: Color(0xFFA2B4A9)),
                      filled: true,
                      fillColor: const Color(0xFF2B362F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement send message
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF94E0B1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(84, 40),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Color(0xFF121714),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isFarmer;
  final String message;
  final String senderName;
  final String imageUrl;

  const ChatMessage({super.key, 
    required this.isFarmer,
    required this.message,
    required this.senderName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isFarmer ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = isFarmer ? const Color(0xFF38E078) : const Color(0xFF2B362F);
    final textColor = isFarmer ? const Color(0xFF111714) : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isFarmer ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isFarmer)
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 20,
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                Text(
                  senderName,
                  style: const TextStyle(
                    color: Color(0xFFA2B4A9),
                    fontSize: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isFarmer)
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 20,
            ),
        ],
      ),
    );
  }
}
