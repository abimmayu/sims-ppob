import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';

class ButtonFilled extends StatelessWidget {
  const ButtonFilled({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.title().copyWith(
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
