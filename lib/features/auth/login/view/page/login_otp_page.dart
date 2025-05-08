import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/custom_widgets/custom_button_widget.dart';
import '../../../../../core/theme/color_value.dart';

class LoginOtpPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const LoginOtpPage({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  bool isActive = false;
  TextEditingController otpController = TextEditingController();

  void verifyOtp() async {
    String otp = otpController.text.trim();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      print('Login Berhasil: ${userCredential.user?.phoneNumber}');
      // Bisa redirect ke halaman lain atau simpan user data
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFBFBFB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5.h),
              SvgPicture.asset(
                "assets/icons/arrow_back.svg",
                width: 24.w,
                fit: BoxFit.cover,
              ),
              Gap(34.h),
              Text(
                "Masukkan nomor handphone aktif untuk masuk",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Gap(23.h),
              SizedBox(
                width: double.infinity,
                child: Expanded(
                  child: PinCodeTextField(
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorValue.darkColor,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    appContext: context,
                    length: 4,
                    cursorColor: Colors.black,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      inactiveColor: Color(0xffF4F4F4),
                      activeFillColor: const Color(0xffE5E5E5),
                      selectedFillColor: const Color(0xffE5E5E5),
                      inactiveFillColor: const Color(0xffE5E5E5),
                      activeColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.r),
                      fieldHeight: 53.h,
                      fieldWidth: 53.w,
                    ),
                    onChanged: (value) {

                      setState(() {
                        isActive = value.length == 4;
                      });



                    },
                  ),
                ),
              ),
              Spacer(),

              isActive
                  ? GestureDetector(
                    onTap: () {

                    },
                    child: CustomButtonWidget(
                      label: "Masuk",
                      backgroundColor: ColorValue.darkColor,
                      labelColor: Colors.white,
                    ),
                  )
                  : CustomButtonWidget(
                    label: "Masuk",
                    backgroundColor: Color(0xffE9E9E9),
                    labelColor: Color(0xff474747),
                  ),
              Gap(50.h),
            ],
          ),
        ),
      ),
    );
  }
}
