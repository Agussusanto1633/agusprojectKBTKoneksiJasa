import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:servista/core/theme/app_font_weight.dart';

import '../../../../../core/theme/color_value.dart';

Future<String?> paymentMethodBottomSheet(BuildContext context) {
  final List<String> bank = ["BCA", "BRI", "Mandiri"];

  String? selectedMethod;

  return showModalBottomSheet<String>(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(22.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Text(
                    "Pilih Metode Pembayaran",
                    style: GoogleFonts.mulish(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3F414E),
                    ),
                  ),
                ),
                Gap(14.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Transfer Bank",
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.w),

                // Grid list of banks
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children:
                        bank.map((item) {
                          final isSelected = selectedMethod == item;

                          Color selectedColor;
                          Color textColor;

                          if (isSelected) {
                            selectedColor = ColorValue.primaryColor;
                            textColor = Colors.black;
                          } else {
                            selectedColor = Colors.white;
                            textColor = Colors.black;
                          }

                          return Padding(
                            padding: EdgeInsets.only(bottom: 13.5.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedMethod = item;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 40.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/payment/${item.toLowerCase()}.png",
                                      width: 51.w,
                                      height: 17.h,
                                    ),
                                    Gap(11.w),
                                    Text(
                                      item,
                                      style: GoogleFonts.mulish(
                                        fontSize: 16.sp,
                                        fontWeight: AppFontWeight.regular,
                                        color: textColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ColorValue.primaryColor,
                                          width: 1.w,
                                        ),
                                      ),
                                      child: Container(
                                        height: 6.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 8.w),
              ],
            );
          },
        ),
      );
    },
  );
}

Widget _buildLegendBox(String label, Color bg, Color textColor) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(5.r),
    ),
    child: Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 10.sp,
        color: textColor,
        height: 2,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
