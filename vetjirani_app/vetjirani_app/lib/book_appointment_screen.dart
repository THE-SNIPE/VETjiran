import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'Book Appointment',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Service',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ServiceChip(label: 'General Checkup'),
                ServiceChip(label: 'Vaccination'),
                ServiceChip(label: 'Emergency Care'),
                ServiceChip(label: 'Surgery'),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Select Date',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            const SizedBox(height: 12),
            DateSelector(),
            const SizedBox(height: 24),
            const Text(
              'Select Time',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            const SizedBox(height: 12),
            TimeSelector(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement booking confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38E078),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  color: Color(0xFF111714),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceChip extends StatelessWidget {
  final String label;

  const ServiceChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      selectedColor: const Color(0xFF38E078),
      backgroundColor: const Color(0xFF3D5245),
      onSelected: (bool selected) {
        // TODO: Handle service selection
      },
    );
  }
}

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for date selector UI
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF29382F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Date Picker Placeholder',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for time selector UI
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF29382F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Time Slots Placeholder',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF29382F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'AM/PM Placeholder',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
