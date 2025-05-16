import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_style.dart';
import '../../../core/theme/color_value.dart';
import '../widgets/bottom_sheets_widgets/booking_flow.dart';

class DetailServicePage extends StatefulWidget {
  const DetailServicePage({super.key});

  @override
  State<DetailServicePage> createState() => _DetailServicePageState();
}

class _DetailServicePageState extends State<DetailServicePage>
    with SingleTickerProviderStateMixin {
  final List<String> galleryImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9WYzQWEjZck6kOZi8VIec_mK2Der3rh-6Mw&s',
    'https://cms.gokomodo.com/wp-content/uploads/2023/10/Blog-banner-corpcomm-_-Pemotong-rumput--1024x769.jpg',
    'https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg',
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: systemUiOverlayLightStyle,
            automaticallyImplyLeading: false,
            backgroundColor: ColorValue.primaryColor,
            titleSpacing: 0,
            pinned: true,
            expandedHeight: 220.w,
            collapsedHeight: kToolbarHeight,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  "assets/icons/back-button.svg",
                  width: 32.w,
                  height: 32.w,
                  color: Colors.white,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9WYzQWEjZck6kOZi8VIec_mK2Der3rh-6Mw&s",
                    placeholder: 'assets/images/service/placeholder.png',
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 31.w, right: 16.w),
                      child: SizedBox(
                        height: 50.w,
                        child: ListView.separated(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: galleryImages.length,
                          separatorBuilder: (_, __) => SizedBox(width: 10.w),
                          itemBuilder: (context, index) {
                            final imageUrl = galleryImages[index];
                            return GestureDetector(
                              onTap: () => _showImageDialog(imageUrl),
                              child: Container(
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/service/placeholder.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.network(
                                    imageUrl,
                                    width: 50.w,
                                    height: 50.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Layanan Potong Rumput",
                        style: textTheme.displaySmall,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text("1.3 km", style: textTheme.bodyLarge),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        height: 12.w,
                        width: 12.w,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        "4.2",
                        style: textTheme.bodyLarge?.copyWith(
                          color: ColorValue.dark2Color,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "(40)",
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorValue.dark2Color,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        "assets/icons/discount.svg",
                        height: 12.w,
                        width: 12.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "10% Discount area",
                        style: textTheme.bodyLarge?.copyWith(
                          color: ColorValue.dark2Color,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1.h,
                    margin: EdgeInsets.symmetric(vertical: 10.w),
                    color: const Color(0xFFDFDFDF),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45.w,
                        width: 45.w,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/service/maps.png",
                              height: 36.w,
                              width: 36.w,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: -1,
                              right: -1,
                              child: SvgPicture.asset(
                                "assets/icons/maps.svg",
                                height: 24.w,
                                width: 24.w,
                                color: ColorValue.blueLinkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jl. Merdeka Barat No.45, RT.4/RW.5, Blimbing, Kec. Blimbing, Kota Malang, Daerah Khusus Kota Malang 65122",
                              style: textTheme.bodySmall,
                            ),
                            SizedBox(height: 5.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Buka di Google Maps",
                                  style: textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: ColorValue.blueLinkColor,
                                  ),
                                ),
                                Text(
                                  "Lokasimu Saat ini",
                                  style: textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1.h,
                    margin: EdgeInsets.symmetric(vertical: 10.w),
                    color: const Color(0xFFDFDFDF),
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: ColorValue.darkColor,
                    unselectedLabelColor: ColorValue.darkColor.withOpacity(0.5),
                    indicatorColor: ColorValue.primaryColor,
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.only(bottom: 7.w),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.w,
                        color: ColorValue.primaryColor,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(100.r),
                      insets: EdgeInsets.symmetric(horizontal: 16.w * -1),
                    ),
                    tabs: const [Tab(text: "Fasilitas"), Tab(text: "Review")],
                  ),
                  AnimatedBuilder(
                    animation: _tabController,
                    builder: (context, child) {
                      final tabIndex = _tabController.index;

                      double height;
                      if (tabIndex == 0) {
                        final textSize = _measureTextSize(
                          textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        );
                        height = (textSize.height + 4.w) * 80 + 16.w;
                      } else {
                        final textSize = _measureTextSize(
                          textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        );
                        height = ((textSize.height * 2) + 24.w + 10) * 5 + 24.w;
                      }

                      return SizedBox(
                        height: height,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 16.w),
                              itemCount: 80,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 4.w),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                            2,
                                        child: Text(
                                          "Cuci Eksterior & Interior $index",
                                          style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ":   Termasuk",
                                        style: textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 16.w),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 24.w,
                                          height: 24.w,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/service/photoprofile.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: const CircleBorder(),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Text(
                                          "Andi",
                                          style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: ColorValue.dark2Color,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        SvgPicture.asset(
                                          "assets/icons/thumb.svg",
                                          width: 8.w,
                                          height: 8.w,
                                        ),
                                        SizedBox(width: 4.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                            vertical: 1.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorValue.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              3.r,
                                            ),
                                          ),
                                          child: Text(
                                            "5/5",
                                            style: textTheme.bodyLarge
                                                ?.copyWith(fontSize: 8.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 36.w),
                                        Expanded(
                                          child: Text(
                                            "Layanan cuci mobil sangat memuaskan, mobil saya bersih dan wangi seperti baru!",
                                            style: textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.w),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x14000000),
              blurRadius: 9,
              offset: const Offset(0, -3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Harga Layanan",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorValue.darkColor,
                  ),
                ),
                Text(
                  "Rp. 300.000",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorValue.darkColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            SizedBox(
              width: double.infinity,
              height: 50.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorValue.primaryColor,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),

                onPressed: () => startBookingFlow(context),

                child: Text(
                  "Sewa Sekarang",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorValue.darkColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size _measureTextSize(TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: "The fox jumps over the lazy dog", style: style),
      maxLines: 1,
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }

  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                child: ClipRRect(
                  child: Image.network(imageUrl, fit: BoxFit.fitWidth),
                ),
              ),
            ),
          ),
    );
  }
}
