import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_value.dart';

class AppThemeData {
  static ThemeData getThemeLight() {
    Color primary90Color = ColorValue.primary90Color;
    final Map<int, Color> primary90ColorMap = {
      50: primary90Color,
      100: primary90Color,
      200: primary90Color,
      300: primary90Color,
      400: primary90Color,
      500: primary90Color,
      600: primary90Color,
      700: primary90Color,
      800: primary90Color,
      900: primary90Color,
    };
    final MaterialColor primaryMaterialColor = MaterialColor(
      primary90Color.value,
      primary90ColorMap,
    );

    return ThemeData(
      primaryColor: primary90Color,
      primarySwatch: primaryMaterialColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(
        toolbarHeight: 56.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorValue.netralColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.r)),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: ColorValue.primary90Color.withOpacity(0.4),
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
          backgroundColor: ColorValue.primary90Color,
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: ColorValue.netralColor,
        ),
        // Regular 12
        bodyMedium: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: ColorValue.netralColor,
        ),
        // Semi Bold 12
        bodyLarge: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: ColorValue.netralColor,
        ),
        // Bold 12
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        // Bold 14 (Button Text)
        titleMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorValue.netralColor,
        ), // Bold 16 (Subtitle 2)
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValue.primary20Color),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValue.primary20Color),
          borderRadius: BorderRadius.circular(8.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValue.primary20Color),
          borderRadius: BorderRadius.circular(8.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValue.primary20Color),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValue.primary20Color),
          borderRadius: BorderRadius.circular(8.r),
        ),
        activeIndicatorBorder: BorderSide(color: ColorValue.primary20Color),
        outlineBorder: BorderSide(color: ColorValue.primary20Color),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValue.primary20Color),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
