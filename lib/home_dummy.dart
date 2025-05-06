import 'package:flutter/material.dart';
import 'package:servista/core/theme/color_value.dart';

class HomeDummy extends StatefulWidget {
  const HomeDummy({super.key});

  @override
  State<HomeDummy> createState() => _HomeDummyState();
}

class _HomeDummyState extends State<HomeDummy> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 250,
          color: ColorValue.primaryColor,
          child: Center(child: Text("Hello World", style: textTheme.bodyLarge)),
        ),
      ),
    );
  }
}
