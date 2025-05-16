import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servista/features/auth/login/view/page/login_otp_page.dart';
import 'package:servista/features/auth/login/view/page/login_page.dart';
import 'package:servista/features/auth/login/view/page/login_phone_page.dart';
import 'package:servista/features/booking/page/detail_booking_page.dart';
import 'package:servista/features/home/page/search_service_page.dart';
import 'package:servista/features/service/pages/detail_service_page.dart';
import 'package:servista/features/splash/view/page/splash_page.dart';
import 'package:servista/features/home/page/home_page.dart';
import 'package:servista/firestore/firestore_page.dart';
import 'package:servista/home_dummy.dart';

import 'core/nav_bar/nav_bar.dart';
import 'core/theme/app_style.dart';
import 'core/theme/app_theme.dart';
import 'features/profile/page/profile_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  deviceOrientation();
  statusBarDarkStyle();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Servista',
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getThemeLight(),
          home: child,
        );
      },
      child: const FirestorePage(),
    );  }
}
