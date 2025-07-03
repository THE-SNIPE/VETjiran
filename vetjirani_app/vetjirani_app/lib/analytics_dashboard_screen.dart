import 'package:flutter/material.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data for analytics
    final appointmentStats = {
      'Total Appointments': 120,
      'Completed': 95,
      'Pending': 15,
      'Cancelled': 10,
    };

    final commonDiseases = [
      'Foot and Mouth Disease',
      'Mastitis',
      'Poultry Respiratory Disease',
      'Parasitic Infections',
    ];

    final treatmentOutcomes = {
      'Successful': 85,
      'Ongoing': 10,
      'Failed': 5,
    };

    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'Analytics Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Appointment Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          ...appointmentStats.entries.map((entry) => ListTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  entry.value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              )),
          const Divider(color: Colors.white54),
          const Text(
            'Common Diseases',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          ...commonDiseases.map((disease) => ListTile(
                title: Text(
                  disease,
                  style: const TextStyle(color: Colors.white),
                ),
              )),
          const Divider(color: Colors.white54),
          const Text(
            'Treatment Outcomes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          ...treatmentOutcomes.entries.map((entry) => ListTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  entry.value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
