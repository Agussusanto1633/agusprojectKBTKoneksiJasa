import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servista/features/service/pages/detail_service_page.dart';

import '../../../core/theme/color_value.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailServicePage(
//service model dummy or null data
          service: null,
          )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Color(0x19181320),
              blurRadius: 0,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x16181320),
              blurRadius: 35.32,
              offset: Offset(0, 35.32),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x02181320),
              blurRadius: 56.10,
              offset: Offset(0, 141.30),
              spreadRadius: 0,
            ),
          ],
        ),

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80.w,
                    width: 80.w,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9WYzQWEjZck6kOZi8VIec_mK2Der3rh-6Mw&s",
                        ),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.w),
                        Text(
                          "Layanan Potong Rumput",
                          style: textTheme.titleSmall,
                        ),
                        SizedBox(height: 3.w),
                        Text(
                          "Jln. Jend. Sudirman No.25",
                          style: textTheme.bodySmall,
                        ),
                        SizedBox(height: 10.w),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star.svg",
                              height: 14.w,
                              width: 15.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "4.2",
                              style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text("(40)", style: textTheme.bodySmall),
                            Spacer(),
                            Text("300k", style: textTheme.titleSmall),
                            SizedBox(width: 2.w),
                            Text("/jam", style: textTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 1.h, color: Color(0xFFDFDFDF)),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Text(
                    "Available 10 Slot Todays",
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorValue.dark2Color,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset("assets/icons/discount.svg"),
                  SizedBox(width: 4.w),
                  Text(
                    "Dapatkan Diskon 5%",
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorValue.dark2Color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
