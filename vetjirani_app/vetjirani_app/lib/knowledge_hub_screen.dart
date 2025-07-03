import 'package:flutter/material.dart';

class KnowledgeHubScreen extends StatelessWidget {
  final List<KnowledgeItem> featuredItems = [
    KnowledgeItem(
      title: 'Common Diseases in Cattle',
      description: 'Learn about common cattle diseases and their treatments.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBfUQssNs9qCsrBg6Hrsypq4vKfmX0P6m3qvNKRdn_J4xmf1k87tFma-6P9xvKZDI4SYa8UlxCKnmmViRQ4bZlyEC-Y6eWV4ZJiCWgMz9mF2i_ZAQ66DvOITUHxFyMVls_vclPqqNQXtmsCM0ZeAYkXMC8somXz_5JigQ0GzIzgQORBs93_Q4aMT7R3bBKwVZwbjawbIfagY7j0jguv-ykFewoHfLA-AGH-ddM2HO1kUclcUXWo4LenA1ZG8iY0uZfJhYTQ03RRHDo',
    ),
    KnowledgeItem(
      title: 'Goat Health Management',
      description: 'Essential practices for maintaining healthy goats.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAhYoZdS7g3ZZp6a7D4q0XoNAgnbNB_UdXZDHZRwiHo9hJkPejAb_sxN988me_oGLWTmroWSZmwR938bvhuXAzPWorqdicUEkERv_pP6Mc6WffhhSjWkjvsyBRbbtp7ml_yWPVIrpV6Q2GKkQwFmP5o-m6EPmPqmx5EZZmS07FqtaHxm7D99Rc5hn6fhkxH7u5Z8NfSPf3dOO-S4YC-ykAgGDFenULBLBHj1EVrKqwOyh0rdizzAUIOD_0fG4MGwFNlIfv4f3Ix1-8',
    ),
    KnowledgeItem(
      title: 'Poultry Care Tips',
      description: 'Tips for raising healthy and productive poultry.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDhNkQxeUsdzgydO9jwQrlml1m3z0XggwHonn2jjzZbxICDqRwivneQ9Dsd19FAKOTOVG16gQhz2CKuuJDNMEgbMIiXmUMNFKvZurVFt0Cv6Wa_aPl3-DTUA_sphqskA6hkFlJcNWfqeYPy8ojmrqLNm5Mofr9mMlMHdKpA0pXWf5j73G5tOeNuz0esofM-c7JCytBIHpy7tOWbcw15_dKrGwpd_cS2Q2agh_tRvMFk2s5wp_q6QMVFGEs_z0edj9gDd5yzpW-XYrU',
    ),
  ];

  final List<KnowledgeItem> categories = [
    KnowledgeItem(title: 'Cattle', icon: Icons.pets),
    KnowledgeItem(title: 'Sheep & Goats', icon: Icons.pets),
    KnowledgeItem(title: 'Pigs', icon: Icons.pets),
    KnowledgeItem(title: 'Poultry', icon: Icons.pets),
    KnowledgeItem(title: 'Dogs', icon: Icons.pets),
    KnowledgeItem(title: 'Cats', icon: Icons.pets),
  ];

  const KnowledgeHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111714),
        elevation: 0,
        title: const Text(
          'Knowledge Hub',
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
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for articles, videos, and tips',
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
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Featured',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.015,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredItems.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final item = featuredItems[index];
                      return FeaturedCard(item: item);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.015,
                  ),
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  padding: EdgeInsets.zero,
                  children: categories
                      .map((category) => CategoryCard(item: category))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KnowledgeItem {
  final String title;
  final String? description;
  final String? imageUrl;
  final IconData? icon;

  KnowledgeItem({required this.title, this.description, this.imageUrl, this.icon});
}

class FeaturedCard extends StatelessWidget {
  final KnowledgeItem item;

  const FeaturedCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2620),
        borderRadius: BorderRadius.circular(16),
        image: item.imageUrl != null
            ? DecorationImage(
                image: NetworkImage(item.imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (item.description != null)
              Text(
                item.description!,
                style: const TextStyle(
                  color: Color(0xFFA2B4A9),
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final KnowledgeItem item;

  const CategoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2620),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3D5245)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          if (item.icon != null)
            Icon(item.icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
