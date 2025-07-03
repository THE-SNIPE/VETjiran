import 'package:flutter/material.dart';

class SupportHelpCenterScreen extends StatelessWidget {
  const SupportHelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121714),
        elevation: 0,
        title: const Text(
          'Support',
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          const FAQItem(
            question: 'How to book an appointment?',
            answer: 'You can search for vets and book appointments through the app.',
          ),
          const FAQItem(
            question: 'How to contact support?',
            answer: 'Use the contact form below to reach out to our support team.',
          ),
          const SizedBox(height: 24),
          const Text(
            'Contact Support',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Your Email',
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF1E2520),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF404F46)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF404F46)),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Subject',
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF1E2520),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF404F46)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF404F46)),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Message',
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF1E2520),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF404F46)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF404F46)),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Submit support request
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF94E0B1),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Color(0xFF121714),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Report an Issue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF2B362F),
              child: Icon(Icons.flag, color: Colors.white),
            ),
            title: const Text(
              'Report an issue',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // TODO: Implement report issue
            },
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            answer,
            style: const TextStyle(color: Color(0xFFA2B4A9)),
          ),
        ),
      ],
    );
  }
}
