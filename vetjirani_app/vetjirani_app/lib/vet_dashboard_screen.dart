import 'package:flutter/material.dart';
import 'appointment_requests_screen.dart';

class VetDashboardScreen extends StatelessWidget {
  const VetDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121714),
        elevation: 0,
        title: const Text(
          'VetJirani',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Availability',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Color(0xFFA2B4A9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: true,
                  activeColor: const Color(0xFF94E0B1),
                  onChanged: (bool value) {
                    // TODO: Implement availability toggle
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Today's Requests",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentRequestsScreen()),
                );
              },
              child: const RequestCard(
                title: 'Cow with fever',
                time: '10:00 AM - 11:00 AM',
              ),
            ),
            const SizedBox(height: 12),
            const RequestCard(
              title: 'Goat vaccination',
              time: '11:30 AM - 12:30 PM',
            ),
            const SizedBox(height: 12),
            const RequestCard(
              title: 'Sheep with cough',
              time: '2:00 PM - 3:00 PM',
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String title;
  final String time;

  const RequestCard({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF121714),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                time,
                style: const TextStyle(color: Color(0xFFA2B4A9), fontSize: 14),
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}
