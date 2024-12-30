import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/constant/app_form_format.dart';
import 'package:sims_ppob_abim/core/router/page_router.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/core/widgets/button_filled.dart';
import 'package:sims_ppob_abim/core/widgets/logo_horizontal.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/providers/auth_providers.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/screen/widgets/text_field_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isEmailFilled = false;
  bool isFirstnameFilled = false;
  bool isLastnameFilled = false;
  bool isPasswordFilled = false;
  bool isConfirmPasswordFilled = false;

  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(builder: (
      context,
      value,
      child,
    ) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          if (value.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
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
                        value.errorMessage ?? "",
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
              ),
            );
            value.setErrorMessage(null);
          }
        },
      );
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: controller.formKeyRegister,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: LogoWidgetHorizontal(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Lengkapi data untuk membuat akun",
                          style: AppTextStyle.title().copyWith(
                            fontSize: 72.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          preffixIcon: Icons.alternate_email_outlined,
                          hintText: "masukkan email anda",
                          controller: emailController,
                          isFilled: isEmailFilled,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(
                                () {
                                  isEmailFilled = true;
                                },
                              );
                            } else {
                              setState(
                                () {
                                  isEmailFilled = false;
                                },
                              );
                            }
                          },
                          validator: (value) {
                            final regex = RegExp(AppFormFormat.email);
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!regex.hasMatch(value)) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          preffixIcon: Icons.person_outline,
                          hintText: "nama depan",
                          controller: firstnameController,
                          isFilled: isFirstnameFilled,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(
                                () {
                                  isFirstnameFilled = true;
                                },
                              );
                            } else {
                              setState(
                                () {
                                  isFirstnameFilled = false;
                                },
                              );
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama depan tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          preffixIcon: Icons.person_outline,
                          hintText: "nama belakang",
                          controller: lastnameController,
                          isFilled: isLastnameFilled,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(
                                () {
                                  isLastnameFilled = true;
                                },
                              );
                            } else {
                              setState(
                                () {
                                  isLastnameFilled = false;
                                },
                              );
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama belakang tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          preffixIcon: Icons.lock_outline,
                          hintText: "buat password",
                          controller: passwordController,
                          isPassword: true,
                          obsecureText: obsecurePassword,
                          isFilled: isPasswordFilled,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                isPasswordFilled = true;
                              });
                            } else {
                              setState(() {
                                isPasswordFilled = false;
                              });
                            }
                          },
                          onTap: () => setState(
                            () => obsecurePassword = !obsecurePassword,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.length < 8) {
                              return "Password minimal 8 karakter";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          preffixIcon: Icons.lock_outline,
                          hintText: "konfirmasi password",
                          controller: confirmPasswordController,
                          isPassword: true,
                          obsecureText: obsecureConfirmPassword,
                          isFilled: isConfirmPasswordFilled,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                isConfirmPasswordFilled = true;
                              });
                            } else {
                              setState(() {
                                isConfirmPasswordFilled = false;
                              });
                            }
                          },
                          onTap: () => setState(
                            () => obsecureConfirmPassword =
                                !obsecureConfirmPassword,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.length < 8) {
                              return "Password minimal 8 karakter";
                            } else if (value != passwordController.text) {
                              return "Password tidak sama";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ButtonFilled(
                          text: "Registrasi",
                          onPressed: () async {
                            if (controller.formKeyRegister.currentState!
                                .validate()) {
                              return await controller.register(
                                emailController.text,
                                firstnameController.text,
                                lastnameController.text,
                                passwordController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            context.goNamed(AppRoute.loginScreen.name);
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "sudah punya akun? login ",
                              style: AppTextStyle.subtitle(),
                              children: [
                                TextSpan(
                                  text: "di sini",
                                  style: AppTextStyle.subtitle().copyWith(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
