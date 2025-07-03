import 'package:flutter/material.dart';

class VetProfileScreen extends StatelessWidget {
  const VetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'Dr. Imani Mwangi',
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
          children: [
            const CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAlOsnxSHory0iXBhALEx4fJasaHXCm2_yrgaN3y363axk_J3kq67loaxRHqx9vitrH8U9rfybxLrD3fG8W_EWpr3WRE2qFqlKwY3Mz0VpO65hqnNvnhfDNlROSgeTQJdiL38roFucZS2Nl0clQkoL2xmkhl3KV00t9Rn0uNTjkzVjGsYC7cpUbbotDUqbJnCLdeQvB9bxF1eJ4wWTaqMImO6-2stmYVxM7QJuO8ZgupIvFfP0peXmItKiwpdEeWNpfC6kMK05Z8fY',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Dr. Imani Mwangi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              'Veterinarian',
              style: TextStyle(
                color: Color(0xFFA2B4A9),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              '10 years of experience',
              style: TextStyle(
                color: Color(0xFFA2B4A9),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Specialties',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SpecialtyChip(label: 'Livestock'),
                SpecialtyChip(label: 'Poultry'),
                SpecialtyChip(label: 'Small Animals'),
              ],
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Availability',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015,
                ),
              ),
            ),
            const SizedBox(height: 12),
            AvailabilityCalendar(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
                );
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

class SpecialtyChip extends StatelessWidget {
  final String label;

  const SpecialtyChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: const Color(0xFF29382F),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }
}

class AvailabilityCalendar extends StatelessWidget {
  const AvailabilityCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for calendar UI
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF29382F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.white),
                onPressed: () {
                  // TODO: Previous month
                },
              ),
              const Text(
                'July 2024',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {
                  // TODO: Next month
                },
              ),
            ],
          ),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(30, (index) {
              int day = index + 1;
              bool isSelected = day == 5; // Example selected day
              return TextButton(
                onPressed: () {
                  // TODO: Select day
                },
                style: TextButton.styleFrom(
                  backgroundColor: isSelected ? const Color(0xFF38E078) : Colors.transparent,
                  shape: const CircleBorder(),
                ),
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF111714) : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
