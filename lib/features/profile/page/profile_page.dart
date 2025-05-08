import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:servista/core/theme/color_value.dart';
import 'package:servista/features/profile/widgets/profile_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.darkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/arrow_back.svg",
                  width: 24.w,
                  color: ColorValue.primaryColor,
                ),
                Gap(22.h),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 150.w,
                            height: 150.w, // Sesuaikan agar tetap bulat
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorValue.primaryColor,
                                width: 5.w,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                "https://i.pinimg.com/236x/95/68/6a/95686a79fda78c1d70ca6bbc09587977.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 48.h,
                              width: 48.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Padding(
                                padding: EdgeInsets.all(12.w),
                                child: SvgPicture.asset(
                                  "assets/icons/camera.svg",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(18.h),
                      Text(
                        "Firman",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Gap(5.h),
                      Text(
                        "08128539432",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Gap(18.h),
                      ProfileMenu(
                        title: "Ubah Profil",
                        icon: "assets/icons/profile.svg",
                      ),
                      Gap(10.h),
                      ProfileMenu(
                        title: "Ganti Password",
                        icon: "assets/icons/unlock.svg",
                      ),
                      Gap(10.h),
                      ProfileMenu(
                        title: "Riwayat Penyewaan",
                        icon: "assets/icons/calendar.svg",
                      ),
                      Gap(38.h),
                      ProfileMenu(title: "Keluar", icon: "assets/icons/logout.svg", isArrow: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
