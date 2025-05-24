import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servista/core/theme/app_font_weight.dart';

class DetailBookingOverviewSection extends StatelessWidget {
  const DetailBookingOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sub Total",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: AppFontWeight.regular,
                      color: Colors.black)),
              Text("Rp 100.000",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: AppFontWeight.medium,
                      color: Colors.black)),
            ],
          ),
          Gap(10.h),
          //biaya pelayanan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Biaya Pelayanan",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: AppFontWeight.regular,
                      color: Colors.black)),
              Text("Rp 0",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: AppFontWeight.medium,
                      color: Colors.black)),
            ],
          ),
          Gap(10.h),
          //harga pemesanan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Harga Pemesanan",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: AppFontWeight.semiBold,
                      color: Colors.black)),
              Text("Rp 100.000",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: AppFontWeight.medium,
                      color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
