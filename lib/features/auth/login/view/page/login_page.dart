import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servista/core/custom_widgets/custom_button_widget.dart';
import 'package:servista/core/theme/color_value.dart';
import 'package:servista/home_dummy.dart';

import '../../../../../core/nav_bar/nav_bar.dart';
import '../../bloc/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(120.h),
            Text(
              "Servista",
              style: GoogleFonts.onest(
                fontSize: 40.sp,
                fontWeight: FontWeight.w700,
                color: ColorValue.darkColor,
              ),
            ),
            Text(
              "Welcome to Servista",
              style: GoogleFonts.mulish(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff3F414E),
              ),
            ),
            SizedBox(height: 60.h),
            Gap(90.h),
            InkWell(
              onTap: () async {
                  try {
                    final userCredential = await authService.signInWithGoogle();
                    if (userCredential.user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const NavBar()),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login failed: $e')),
                    );
                  }
                },



              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffE9E9E9),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/auth/google.png",
                      height: 24.h,
                      width: 24.w,
                    ),
                    Gap(10.w),
                    Text(
                      "Login dengan Google",
                      style: GoogleFonts.poppins(color: Color(0xff474747), fontSize: 14.w, fontWeight: FontWeight.w600),
                    ),
              
                  ],
                ),
              ),
            ),

            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButtonWidget(label: "Daftar dengan nomor handphone", backgroundColor: ColorValue.darkColor,labelColor: Colors.white,),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              child: Divider(
                color: Colors.black,
                height: 40.h,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
