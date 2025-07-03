import 'package:flutter/material.dart';

class AppointmentRequestsScreen extends StatelessWidget {
  final List<AppointmentRequest> requests = [
    AppointmentRequest(
      farmerName: 'Elias Mwangi',
      service: 'Vaccination',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB0lb_Wd04L2-WWI60W11PWumgky7GQqjjYoLqeyROYw3Xy3_L62J91bYnC96AWKZXbhnB4QKERX4bdyCqfFPhRbWQXGuLOm5Z6IpTRCIEZKxVDNMer8_il3-aQ98hsDS_kZHmk8uHyZxMAPRI9PpY-7GjMLB3Pi0PKqba1sl6ldV1NF4O-He53OzPSNSMClnFIXrWWyIOqhuMFfDOwsR47v0-6KDOr_9rXQOBi5-oRQ_MZPZQSas6ySrEav65XwsxKkVC-y6hAnjg',
    ),
    AppointmentRequest(
      farmerName: 'Aisha Hassan',
      service: 'Health Check',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB30gBaU1X3afA7Yn8YJMtY9Uq9xA3EUJyu45SgMNug9b5gp9jKREP6l-4qoy5-qZ5kB2sEPnxpne8Sh6HZcqPh4zocPxDv22M_512YU10ZkAWPATr-R7bd1MKsS8Ywm2Wl-C5R0DR1133sSOwAV2vRpgG5JCbaspmQf984kF4LiL5fuFFYtUxQ7gBLCukR_eovYPHsb8dEHK9W7tSM_bB7zGn8VQ-0pbaLJYNLPfOhL1zvJ1FVhmx-LIOboyrQtaMjhX0Ayzc4s5I',
    ),
    AppointmentRequest(
      farmerName: 'Samuel Kamau',
      service: 'Surgery',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBkqYVIRCCAN2erC0ivMESSYsZBxlugDJBUy5xhM4STgzW-CFCbyrnreYYQHuXACJmDYX5SrjTYwdLjlP66kUm1HjR3aEtHDHtNAnyCz_Y6E6K28urVsrYIHFy7E3h4FAfP3MHWkXUdQ-5ouew-umuqign-WD-fsKn3VsKxo9NYrreAIdBXLuIcEDqSMfPQHqBlePT63Gmbzyi4J9bujnLTGE-HtbKluj9376DM1_jAf7L5gkB9PCQ1ge1sBTzf32FiPpE-7l___1U',
    ),
  ];

  const AppointmentRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121714),
        elevation: 0,
        title: const Text(
          'Appointment Requests',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return AppointmentRequestCard(request: request);
        },
      ),
    );
  }
}

class AppointmentRequest {
  final String farmerName;
  final String service;
  final String imageUrl;

  AppointmentRequest({
    required this.farmerName,
    required this.service,
    required this.imageUrl,
  });
}

class AppointmentRequestCard extends StatelessWidget {
  final AppointmentRequest request;

  const AppointmentRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF121714),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Request',
                        style: TextStyle(
                          color: Color(0xFFA2B4A9),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Farmer: ${request.farmerName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Service: ${request.service}',
                        style: const TextStyle(
                          color: Color(0xFFA2B4A9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(request.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Accept request
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF94E0B1),
                    minimumSize: const Size(84, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Accept',
                    style: TextStyle(
                      color: Color(0xFF121714),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Decline request
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B362F),
                    minimumSize: const Size(84, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Decline',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
