import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servista/core/theme/color_value.dart';
import 'package:servista/features/profile/bloc/profile_bloc.dart';
import 'package:servista/features/profile/bloc/profile_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          final user = state.user;
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorValue.primaryColor,
                        width: 5.w,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        user.photoURL ?? "https://via.placeholder.com/150",
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
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: SvgPicture.asset("assets/icons/camera.svg"),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(18.h),
              Text(
                user.displayName ?? "Nama tidak tersedia",
                style: GoogleFonts.mulish(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Gap(5.h),
              Text(
                user.phoneNumber ?? "No telepon tidak tersedia",
                style: GoogleFonts.mulish(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          );
        } else if (state is ProfileError) {
          return Center(
            child: Text(
              "Error: ${state.message}",
              style: GoogleFonts.mulish(color: Colors.red),
            ),
          );
        }

        return SizedBox.shrink(); // Jika state adalah ProfileInitial
      },
    );
  }
}
