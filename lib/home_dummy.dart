import 'package:flutter/material.dart';
import 'package:servista/core/theme/color_value.dart';

import 'features/auth/login/bloc/auth_service.dart';
import 'features/auth/login/view/page/login_page.dart';

class HomeDummy extends StatefulWidget {
  const HomeDummy({super.key});

  @override
  State<HomeDummy> createState() => _HomeDummyState();
}

class _HomeDummyState extends State<HomeDummy> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            authService.signOut().then((value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  LoginPage()),
              );
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error signing out: $error")),
              );
            });
            },
          child: Container(
            height: 100,
            width: 250,
            color: ColorValue.primaryColor,
            child: Center(child: Text("Hello World", style: textTheme.bodyLarge)),

          ),
        ),
      ),
    );
  }
}
