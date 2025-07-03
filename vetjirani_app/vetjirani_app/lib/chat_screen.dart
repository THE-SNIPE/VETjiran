import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'Dr. Mwangi',
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
                  isFarmer: false,
                  message: 'Hello, how can I help you today?',
                  senderName: 'Dr. Mwangi',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBBMIj2HBcFDT_X1yPOKZaYtGkfpSmaXw02rdmyOtURccLCvAmIOvl40eF62OIPXGJk3p28vMqgrEEclp4BAprm-wkk-KmVDL5EkaFpkG5woYPt97sn2B7CPiSOx91ZWRqjjlcVvcaQMVZ06rGVDQyWwgg_TZ9TihYCSSZ3CMlTr-0jxN7nvGIcMUFaY5ctz0OywFrtAwiyhWgmWOFZWXvFCQFYPAoy5f9mTi1LxfIyQlytqKdy00ObBQkL_FOiZ1uxuk7FPJ6I4Nw',
                ),
                ChatMessage(
                  isFarmer: true,
                  message:
                      "My cow has been showing signs of reduced milk production and seems lethargic. Could you advise?",
                  senderName: 'Farmer Kamau',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuB4KNYB1y8_OyJMZOBq9pZ2mQTRVNwGTMzIj4788JRJVX9k4aGONy1076s7Oqbh3o9d5cRQMGDFeenO-3fSP9-6REvNuXKBNmBdMNRAEc3mJxRyqSKlnQdDU45jK38IaiOsE3ypj2dchLkOwCXq3oSmgnaUAIB5L0NlDB7ZDYd_0hkf0C1LvVtOv_I5DMeL3FVTRDY145cmtepgIlfQHYKeLDpNyeQ-cIemDo5UK4LSlrLZnXh0b2bxgBHlO4mdRHpCcLNWZ-E8d-w',
                ),
                ChatMessage(
                  isFarmer: false,
                  message:
                      'I recommend a check-up. Can you send a photo of the cow\'s condition?',
                  senderName: 'Dr. Mwangi',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBdgu6WR9OtTChlUFM1o-do8d33SAIu-LLZOHi4WV5B8Z_nDJL5k0vKDCDZvLjLut45XaT8kQjgDAlFOPH6umU_EoeVArYoVsEiBOXcwQ-FEGJTNBpr82B_DAO0VP-M7HCch2-60TYmybSGN1hXHiGtFrrfF5AkOJ6RUSEj8i9Q9oMPdzTwctHTzyV9vNphwvZfR9X9C38q8foEAqpb0wgTyLukyAxjJ_gLPSrRH8BOtwbIwuZUoOJ_clWMMLWc6A8Xt6CXIG1yEkE',
                ),
                ChatMessage(
                  isFarmer: true,
                  message: "Sure, here's a recent photo.",
                  senderName: 'Farmer Kamau',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAnwNEHmIDfAIAwTwnIIHY20wNdBbHD4WB1wv5sKvgBkT77OmMqHH00UW6DbKvDx37zhfm8t9yrZlrtFGgIwYQj-9GgjIKuAUlBoBfEQAI-IujLtPa72j3iKthgiCLeRK_MtnviNCRUbfs4dNbeghJtwFo0IIFg0RCYWDvjGzELZ1eAha3kPzYvkZfPI1q6hdi46h1pjBn8XhqXS1U5wKKdbpm3SkCn5sSToQeGTHbu8ZaV5ZOanN6AE5uAiSBXAQGHjyFMDLHhaUo',
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
                      fillColor: const Color(0xFF29382F),
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
    final bgColor = isFarmer ? const Color(0xFF38E078) : const Color(0xFF29382F);
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
