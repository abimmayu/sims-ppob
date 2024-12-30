import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';

class LogoWidgetHorizontal extends StatelessWidget {
  const LogoWidgetHorizontal({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.logo,
          height: size ?? 150.h,
        ),
        SizedBox(width: 25.w),
        Text(
          "SIMS PPOB",
          style: AppTextStyle.title().copyWith(fontSize: size ?? 82.sp),
        ),
      ],
    );
  }
}
