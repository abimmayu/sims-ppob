import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';

SnackBar snackBarError({required String? errorMessage}) {
  return SnackBar(
    content: Container(
      alignment: Alignment.center,
      height: 50.h,
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: AppColor.primaryColor,
            size: 0.05.sw,
          ),
          SizedBox(
            width: 50.w,
          ),
          Text(
            errorMessage ?? "",
            style: AppTextStyle.subtitle().copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    ),
    backgroundColor: AppColor.whiteColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(200.w),
      side: const BorderSide(color: AppColor.primaryColor),
    ),
    margin: const EdgeInsets.all(16),
    duration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
  );
}
