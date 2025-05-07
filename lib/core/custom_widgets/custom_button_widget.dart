import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servista/core/theme/color_value.dart';

class CustomButtonWidget extends StatefulWidget {
  final String label;
  Color backgroundColor = ColorValue.primaryColor;
  Color labelColor = ColorValue.darkColor;

  CustomButtonWidget({
    super.key,
    required this.label,
    this.backgroundColor = ColorValue.primaryColor,
    this.labelColor = ColorValue.darkColor,
  });

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Center(
        child: Text(
          widget.label,
          style: GoogleFonts.poppins(color: widget.labelColor, fontSize: 14.w, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
