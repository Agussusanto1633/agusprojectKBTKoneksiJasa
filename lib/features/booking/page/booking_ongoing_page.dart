import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:servista/core/theme/color_value.dart';
import 'package:servista/features/booking/widgets/booking_list.dart';

class BookingOngoingPage extends StatefulWidget {
  const BookingOngoingPage({super.key});

  @override
  State<BookingOngoingPage> createState() => _BookingOngoingPageState();
}

class _BookingOngoingPageState extends State<BookingOngoingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.bgFrameColor,
      body: Column(
        children: [
          Gap(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BookingList(title: "Potong Rumput", date: "Sabtu, 3 Januari 2025", hour: "Pukul 18.00"),
          ),
        ],
      ),
    );
  }
}
