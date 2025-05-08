import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:servista/core/nav_bar/nav_bar.dart';
import 'package:servista/home_dummy.dart';

import '../../../auth/login/view/page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // Delay untuk animasi splash

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User sudah login, arahkan ke HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    } else {
      // User belum login, arahkan ke LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFDB61),
      body: Center(
        child: Text(
          "Servista",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
