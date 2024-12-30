import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.preffixIcon,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.obsecureText = false,
    this.isFilled = false,
    required this.onChanged,
    this.onTap,
    this.validator,
  });

  final IconData preffixIcon;
  final String hintText;
  final bool isPassword;
  final bool obsecureText;
  final TextEditingController controller;
  final bool isFilled;
  final Function(String) onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0.5,
            style: BorderStyle.none,
            color: isFilled ? AppColor.primaryColor : AppColor.greyColor,
          ),
        ),
        prefixIcon: Icon(
          preffixIcon,
          // isPassword ? Icons.lock_outline : Icons.email_outlined,
          color: isFilled ? AppColor.primaryColor : AppColor.greyColor,
        ),
        suffixIcon: isPassword
            ? InkWell(
                onTap: onTap,
                child: Icon(
                  obsecureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColor.greyColor,
                ),
              )
            : null,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
