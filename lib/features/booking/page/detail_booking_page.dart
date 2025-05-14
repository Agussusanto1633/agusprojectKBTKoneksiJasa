import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:servista/core/theme/color_value.dart';

class DetailBookingPage extends StatefulWidget {
  const DetailBookingPage({Key? key}) : super(key: key);

  @override
  State<DetailBookingPage> createState() => _DetailBookingPageState();
}

class _DetailBookingPageState extends State<DetailBookingPage> {

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: const Color(0xff0F1828),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          bottom: 8.h,
                          top: 5.h,
                          right: 18.w,
                          left: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.r),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          // Mengikuti ukuran konten
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/arrow_back.svg",
                                color: Colors.white,
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Detail Pemesanan",
                              style: textTheme.headlineLarge?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 23.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Layanan Potong Rumput",
                              style: textTheme.displayLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "Booking Code",
                              style: textTheme.displayLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "126789",
                              style: textTheme.displayLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 45.h),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -32.5.h,
                  right: -32.5.w,
                  child: Container(
                    height: 75.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                      color: ColorValue.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 23.h, left: 20.w, right: 23.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pekerja Telah menyelesaikan pesanan - Sabtu, 3 Januari 2025",
                    style: textTheme.displayLarge!.copyWith(
                      color: ColorValue.darkColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    "Pekerjaan Potong Rumput",
                    style: textTheme.displayLarge!.copyWith(
                      color: Color(0xff777777),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 11.r,
                          horizontal: 17.r,
                        ),
                        decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text(
                          "Penilaian Servis",
                          style: textTheme.displayLarge!.copyWith(
                            color: ColorValue.darkColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 50.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 11.r,
                          horizontal: 17.r,
                        ),
                        decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text(
                          "Pesan Ulang",
                          style: textTheme.displayLarge!.copyWith(
                            color: ColorValue.darkColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 6.h,
              color: const Color(0xffF3F3F3),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xffADB5BD),
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pesananmu Sudah Dikerjakan!",
                    style: textTheme.displayLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // _buildCircleProgress("Booked")

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _buildCircleProgress(String text) {
  //   return Row(
  //     children: [
  //       Container(height: 30.h, width: 30.w,
  //         decoration: BoxDecoration(
  //           color: Color(0xff313131),
  //           shape: BoxShape.circle,
  //           border: Border.all(
  //             color: Color(0xffffffff),
  //             width: 2.w,
  //           ),
  //         ),
  //         child: Center(
  //           child: SvgPicture.asset(
  //             "assets/icons/check_fat.svg",
  //             color: Colors.white,
  //             width: 15.w,
  //             height: 15.h,
  //           ),
  //         ),
  //       ),
  //       Container(width: 62.w,height: 5.h,
  //         decoration: BoxDecoration(
  //           color: Color(0xffffffff),
  //           borderRadius: BorderRadius.circular(50.r),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
