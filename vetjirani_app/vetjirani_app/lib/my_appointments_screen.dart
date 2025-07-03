import 'package:flutter/material.dart';

class MyAppointmentsScreen extends StatelessWidget {
  final List<Appointment> upcomingAppointments = [
    Appointment(
      dateTime: 'Tomorrow, 10:00 AM',
      vetName: 'Dr. Imani',
      service: 'Consultation',
      status: 'Pending',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCD1E_ArSoFwNQWTp-gHAyW6ctqvl8Locw8iY3AN_VFIlY11Rg-t98Kb2hsSEEMTh0cH4wMepmJQ5iUs-cTMp_is8Tzcv4FmxYD-WrA2vWI1Q2hBtKdTeivm7n-V0zXVUJ7T3wms02Oa7FL12ebsKQrcCWDd6Xh2O_gkLYW-1ISyOM8YsfItycjeIiwmYaESzmT1jiKiBASsetQ3iNKLUQn8igkwHqqrT7rSs580fah9ARN8lGfn7x2_Tw7tikcUaVqXEzlcDSUQwA',
    ),
    Appointment(
      dateTime: '2024-07-20, 2:00 PM',
      vetName: 'Dr. Kamau',
      service: 'Vaccination',
      status: 'Confirmed',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDJjmpUZlwg6pjaOTadJ8qr3GE63RUnezlEB1hkhHuISjdGhNMwWIm3yfRNt1626l6Hqvr7Ka5vxC0uCscEXWHRG-k2pn0BYVm2MhWSYCpjvde5Hab0Gbnq_Io_lTTs4rv8TJ_YkoG_PvdNuIwaizv7BvQYpFGYg2FZBLC12b6EAAu7p-UzAduwl2y14HGgG2Fv5Yal81JAlFLhOcq6wYFal4dbhbnRAQPJ6nNOw3Vgr1I1WtClZku9h7LR3yhGaNCuoxUxg7c6A_k',
    ),
  ];

  final List<Appointment> pastAppointments = [
    Appointment(
      dateTime: '2024-07-10, 11:00 AM',
      vetName: 'Dr. Imani',
      service: 'Consultation',
      status: 'Completed',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBkwcZVTvoKvSyz6mMl6Q3Nl4ycT_YizxAT37tcU_v5RC_oG4yqOpLjj1oKn-GAaWTzxnE8mFdAfWMHsyPEmPzfnf0F7uCfIz_SeuS_oFD42rvZeOndKI4M3F8BiWxI2AoOaDDInGsBxyoMO94uBe4gsEN6NHnrqFzdzB0-pkmvzi1o2QPnn3lSBnwqAcKTznjX0Gl4CAGHsbkD06qYagW5NT4zCj2CyDC3iHni7u7jyjzjIrr210EsfqncGOBGVwrVzcwU2FFrMxE',
    ),
    Appointment(
      dateTime: '2024-06-25, 3:00 PM',
      vetName: 'Dr. Kamau',
      service: 'Vaccination',
      status: 'Completed',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAQMo0E9TRWruDJwhb63eq_kAEC1rtg07CfZ_5gkCZT7WoR4M9_H4Rvu6_5JzSRINTZu0HpD8Ulm8H2LUSEwJM13VLwrTyC9DNU2-Uz1fp3BLBP1dazaRmSKA9-UBSRV1MXyHJeJKfBJNmctnkrpUDj95_L9PEPs3g3YYLf5VjUy_w1HK5MqdIi3K9Y5nYUz8RJ9lX3KwNMFzJ5ZIAZsSMjBJYoBw78MfgkWl1nd3kjfh7oGSeHjEERzeNtyciDJGMDx5626C6FTTU',
    ),
  ];

  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'My Appointments',
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
            'Upcoming',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          ...upcomingAppointments.map((appointment) => AppointmentCard(appointment: appointment, isUpcoming: true)).toList(),
          const SizedBox(height: 24),
          const Text(
            'Past',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          ...pastAppointments.map((appointment) => AppointmentCard(appointment: appointment, isUpcoming: false)).toList(),
        ],
      ),
    );
  }
}

class Appointment {
  final String dateTime;
  final String vetName;
  final String service;
  final String status;
  final String imageUrl;

  Appointment({
    required this.dateTime,
    required this.vetName,
    required this.service,
    required this.status,
    required this.imageUrl,
  });
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final bool isUpcoming;

  const AppointmentCard({super.key, required this.appointment, required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF111714),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(appointment.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.dateTime,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '${appointment.vetName}, ${appointment.service}',
                    style: const TextStyle(color: Color(0xFFA2B4A9), fontSize: 14),
                  ),
                ],
              ),
            ),
            if (isUpcoming)
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement cancel/reschedule
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF29382F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(84, 32),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              )
            else
              const Text(
                'Completed',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
          ],
        ),
      ),
    );
  }
}
