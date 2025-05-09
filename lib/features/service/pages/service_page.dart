import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/scroll/scroll_behavior.dart';
import '../../../core/theme/color_value.dart';
import '../../home/widgets/service_card.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorValue.bgFrameColor,
      body: ScrollConfiguration(
        behavior: NoOverScrollEffectBehavior(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sedang promo nih", style: textTheme.titleMedium),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 15.w),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ServiceCard();
                    },
                  ),
                  SizedBox(height: 10.w),
                  Text("Lapangan terdekat", style: textTheme.titleMedium),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 15.w),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ServiceCard();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}