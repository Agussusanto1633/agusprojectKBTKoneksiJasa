import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servista/home_dummy.dart';

import 'core/theme/app_style.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  deviceOrientation();
  statusBarDarkStyle();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Servista',
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getThemeLight(),
          home: child,
        );
      },
      child: const HomeDummy(),
    );  }
}
