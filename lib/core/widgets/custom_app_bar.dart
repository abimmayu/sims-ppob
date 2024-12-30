import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColor.whiteColor,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Icon(
                    Icons.arrow_back_sharp,
                    size: 0.05.sw,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Kembali",
                    style: AppTextStyle.subtitle(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: AppTextStyle.title().copyWith(fontSize: 60.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 200.w,
            ),
          ],
        ),
      ),
    );
  }
}
