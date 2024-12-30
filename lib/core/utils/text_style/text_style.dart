import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';

class AppTextStyle {
  static const _fontFamily = GoogleFonts.montserrat;

  static TextStyle _baseTextStyle({
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColor.blackColor,
  }) {
    return _fontFamily(
      fontSize: fontSize ?? 28.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle title() => _baseTextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle subtitle() => _baseTextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle body() => _baseTextStyle(
        fontSize: 28.sp,
      );

  static TextStyle tiny() => _baseTextStyle(
        fontSize: 24.sp,
      );
}
