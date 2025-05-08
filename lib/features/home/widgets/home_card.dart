import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/color_value.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 221.w,
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 13,
            offset: Offset(-1, 6),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 31,
            offset: Offset(-6, 51),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x02000000),
            blurRadius: 37,
            offset: Offset(-11, 91),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x00000000),
            blurRadius: 40,
            offset: Offset(-18, 142),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 150.w,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9WYzQWEjZck6kOZi8VIec_mK2Der3rh-6Mw&s",
                ),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 11.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Layanan Potong Rumput',
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                SizedBox(height: 3.h),
                Text(
                  'Jln. Jend. Sudirman No.25',
                  style: textTheme.bodyMedium?.copyWith(
                    color: ColorValue.dark2Color,
                  ),
                ),
                SizedBox(height: 12.w),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/star.svg",
                      height: 14.w,
                      width: 15.w,
                    ),
                    SizedBox(width: 4.w),
                    Text("4.2", style: textTheme.bodyLarge),
                    SizedBox(width: 2.w),
                    Text("(40)", style: textTheme.bodyMedium),
                    Spacer(),
                    Text("300k", style: textTheme.titleMedium),
                    Text("/jam", style: textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
