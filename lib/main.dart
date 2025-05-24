import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servista/features/splash/view/page/splash_page.dart';

import 'core/theme/app_style.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  deviceOrientation();
  statusBarDarkStyle();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting(
    'id_ID',
    null,
  ); // <-- Wajib untuk bahasa Indonesia

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
          title: 'KoneksiJasa',
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getThemeLight(),

          home: child,
        );
      },
      child: SplashPage(),
    );


  }
}
