import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBookingCard extends StatelessWidget {
  const DetailBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return               Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Color(0xffFDC300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.network(
                "https://res.cloudinary.com/dxk0ttpjw/image/upload/v1747269314/image_66_iktwet.png",
                fit: BoxFit.cover,),
            ),
            Gap(12.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/seal_check.svg",
                      width: 14.w,
                      height: 14.h,
                    ),
                    Gap(2.w),
                    Text("Pekerja 2", style: GoogleFonts.roboto(fontSize: 13.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
                Gap(5.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/star.svg",
                      width: 12.w,
                      height: 12.h,
                    ),
                    Gap(4.w),
                    Text("4.5", style: GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w400)),
                    Gap(4.w),
                    Text("(40)", style: GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xff777777))),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
