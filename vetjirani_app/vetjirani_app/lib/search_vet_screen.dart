import 'package:flutter/material.dart';

class SearchVetScreen extends StatelessWidget {
  const SearchVetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'Search Vet',
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Distance', style: TextStyle(color: Colors.white)),
                  backgroundColor: const Color(0xFF29382F),
                  onSelected: (bool selected) {
                    // TODO: Implement filter action
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Specialty', style: TextStyle(color: Colors.white)),
                  backgroundColor: const Color(0xFF29382F),
                  onSelected: (bool selected) {
                    // TODO: Implement filter action
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Availability', style: TextStyle(color: Colors.white)),
                  backgroundColor: const Color(0xFF29382F),
                  onSelected: (bool selected) {
                    // TODO: Implement filter action
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                VetListItem(
                  name: 'Dr. Imani',
                  specialty: 'Livestock Specialist',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDZ0zW3W9iWCU3v8yZJbfmUz0H3Pf4HFb654GKa0jz2inRxMB3jTRbWlLRsJZTYzz1rH9XR8G68kESLs1x_3m1defKxTRd5aSf_z-6ItMPK8kg9pra5VihBPUEZTuuzsiy9vMAD9CX9sBhH2MfWTymBtRXaN1uGKlM_OPEGndbnGCkOyAaAMfYkMjzcy_JCkmQRoEzt0VN8Th_tHWp0RZg4GkCS5TARYo3t7KHk6JJP-q_iDfmCFQo2odl2dVgsVUWQaQucqHeKCJk',
                ),
                VetListItem(
                  name: 'Dr. Kamau',
                  specialty: 'Equine Specialist',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBtkwbA--7_uM8UM_EVTQxDtjEFXDYXsgWzbnVR3-lwo1lXrZMxr6JZCFkWJCngfVJ16v6-bLGpHA7HlqK-suwqCi7R-EJ4OcaoOUjsB-x24C3eWNSfuIKCELeGDAD30BKK8glJTGHaia5l1jiG0Y8rvpplKa4hcC6iSDHxtil0l96d-DaS9-G7-orNWzbx2ULTOP9KpRFdrCfg53QCq5naCKZxsNx5_vhqzX72wYFBmsiooGSqQgGVuyjVPUnEGsCv24OnRK-MTeM',
                ),
                VetListItem(
                  name: 'Dr. Aisha',
                  specialty: 'Poultry Specialist',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAbXs_a6RNDi4nGor5ZSLdOMUg8pi3CQ8TVZoEmgsMZ79xF5QDuaG6VEu2mx_0sA9M9gGVrFxupUtDPs2UebS7rPGFOlzuewwiSSqndWcADvVPXzi_g0yD1DLFaZ5PrFj4kWoNGDOmQkTKd17llhhlreVF8xyRbEXg-x7e3RjTi1ocIe6q5UMmf3zYSsSenesnOfY_tkZtDYWVacCXYXccc_aZaxo9VbJFTSDYiZCkyYe5p6CCeBIssg9ovyv7DOLKUeAzNanzWNdA',
                ),
                VetListItem(
                  name: 'Dr. Mwangi',
                  specialty: 'Small Animal Specialist',
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAcV_tyfhkZv1l9OWG9hi3Ib2_caqY_GH-PkzFZV3eX_G9zvBc3QQfkI96RmML2GWvqfe-zaxU58SU3tKFcluIm-nBeznnl_akxZYK7CrGYgUsXKcPgqTRLjrhtf0tb-QCphBS8W_U65InMllbxvtPt39JCK607VvLw8e70MQItV0pungflixaaYTXLycs_YFERXValeiiwMDaKpUM_MvMp_nAc7T9Pkk6nVfamCSgNNryCiH6QbYUlmjsvw1uiEcQHHUl9ncQhBws',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement Open Map action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38E078),
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Open Map',
                style: TextStyle(
                  color: Color(0xFF111714),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VetListItem extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  const VetListItem({
    Key? key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
  }) : super(key: key);

  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    for (var part in names) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF29382F),
        child: Text(
          getInitials(name),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        specialty,
        style: const TextStyle(color: Color(0xFFA2B4A9)),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VetProfileScreen()),
        );
      },
    );
  }
}

// TODO: Move this to its own file, e.g., lib/vet_profile_screen.dart
class VetProfileScreen extends StatelessWidget {
  const VetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        title: const Text('Vet Profile'),
      ),
      body: const Center(child: Text('Vet Profile Details', style: TextStyle(color: Colors.white))),
    );
  }
}
