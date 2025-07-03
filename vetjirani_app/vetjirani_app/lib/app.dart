import 'package:flutter/material.dart';
import 'home_dashboard_screen.dart';
import 'role_selection_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetJirani',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF39E079),
        scaffoldBackgroundColor: const Color(0xFF122118),
        fontFamily: 'Plus Jakarta Sans',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeDashboardScreen(),
        '/roleSelection': (context) => const RoleSelectionScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF122118),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'VetJirani',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -0.015,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Connecting Farmers & Vets Seamlessly',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCfYx5Fh5XCJ7qTCtzKohPsO8B0_I0v3NUtCM94taufNEIge6Z9EA2TKMA400Cj755XoLARbGnr2snbOPvsdXLxp-08XCICfnHgqStowUiv4PMvSs6oIot5I1EIQJdFlDTXrrAWLrm5nn8UjDejULccfAAiUcJlYxOpej6sK-LWFE1vQZmgJ8M91I8gd8SMlpBg3VkV-zzQQma1C8T5GjGQA6UTQR0lHxHr-6JqUbz1lW-Fps8_mp_DxPkwAZa4NoMNSMu09r6jfs',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/roleSelection');
        },
        backgroundColor: const Color(0xFF39E079),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
