import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/widgets/logo_horizontal.dart';

class HeadProfile extends StatelessWidget {
  const HeadProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoWidgetHorizontal(
            size: 75.h,
          ),
          Image.asset(
            AppAssets.profilePhoto,
          ),
        ],
      ),
    );
  }
}
