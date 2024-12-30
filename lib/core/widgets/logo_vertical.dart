import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';

class LogoWidgetVertical extends StatelessWidget {
  const LogoWidgetVertical({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.logo,
          height: size ?? 60.w,
        ),
        const SizedBox(height: 16),
        Text(
          "SIMS PPOB",
          style: AppTextStyle.title(),
        ),
      ],
    );
  }
}
