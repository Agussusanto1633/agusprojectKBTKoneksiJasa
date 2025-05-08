import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:servista/core/custom_widgets/custom_button_widget.dart';
import 'package:servista/core/theme/color_value.dart';

import 'login_otp_page.dart';

class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({super.key});

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  TextEditingController noHp = TextEditingController();
  bool isActive = false;
  String verificationId = '';

  phoneNumberVerification(
      {required String phoneNumber, required BuildContext context}) async {
    phoneNumber = '+62$phoneNumber';
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginOtpPage(verificationId: verificationId, phoneNumber: phoneNumber),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFBFBFB),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(23.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Color(0xffDFDFDF)),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/auth/indo.png",
                                width: 24.w,
                                fit: BoxFit.cover,
                              ),
                              Gap(3.w),
                              Text(
                                "+62",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorValue.darkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(11.w),
                        Expanded(
                          child: TextField(
                            controller: noHp,
                            onChanged: (value) {

                              if (value.length >  9){
                                setState(() {
                                  isActive = true;
                                });
                              }

                              String filteredValue = value.replaceAll(
                                RegExp(r'[^0-9]'),
                                '',
                              );
                              if (filteredValue.isNotEmpty &&
                                  filteredValue[0] == "0") {
                                noHp.text = value.substring(1);
                                noHp.selection = TextSelection.fromPosition(
                                  TextPosition(offset: noHp.text.length),
                                );
                              }
                              if (filteredValue != value) {
                                noHp.text = filteredValue;
                                noHp.selection = TextSelection.fromPosition(
                                  TextPosition(offset: noHp.text.length),
                                );
                              }
                            },
                            maxLength: 13,
                            buildCounter:
                                (
                                  context, {
                                  required currentLength,
                                  required isFocused,
                                  maxLength,
                                }) => null,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 14.w,
                              color: ColorValue.darkColor,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffDFDFDF),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffDFDFDF),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    isActive ?  GestureDetector(
                      onTap: () {
                        phoneNumberVerification(phoneNumber: noHp.text, context: context);

                      },
                        child: CustomButtonWidget(label: "Masuk", backgroundColor: ColorValue.darkColor, labelColor: Colors.white)) : CustomButtonWidget(label: "Masuk", backgroundColor: Color(0xffE9E9E9), labelColor: Color(0xff474747)),
                    Gap(50.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
