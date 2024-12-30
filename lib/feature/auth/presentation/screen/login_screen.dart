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
import 'package:sims_ppob_abim/core/widgets/logo_vertical.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/providers/auth_providers.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/screen/widgets/snackbar_error.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/screen/widgets/text_field_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isEmailFilled = false;

  bool isPasswordFilled = false;
  bool isObsecureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(builder: (
      context,
      value,
      child,
    ) {
      if (value.isLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ),
        );
      } else if (value.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (value.errorMessage != null) {
              if (value.errorMessage!.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBarError(errorMessage: value.errorMessage),
                );
              }
              value.setErrorMessage(null);
            }
          },
        );
      } else if (value.token != null) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            context.goNamed(AppRoute.homeScreen.name);
          },
        );
      }
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: controller.formKeyLogin,
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
                          "Masuk atau buat akun untuk memulai",
                          style: AppTextStyle.title().copyWith(
                            fontSize: 72.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          preffixIcon: Icons.email_outlined,
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
                            final regExp = RegExp(AppFormFormat.email);
                            if (value!.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!regExp.hasMatch(value)) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          preffixIcon: Icons.lock_outline,
                          hintText: "masukkan password anda",
                          controller: passwordController,
                          isPassword: true,
                          obsecureText: isObsecureText,
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
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.length < 8) {
                              return "Password minimal 8 karakter";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ButtonFilled(
                          text: "Masuk",
                          onPressed: () async {
                            if (controller.formKeyLogin.currentState!
                                .validate()) {
                              debugPrint("Login clicked");
                              return await controller.login(
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            context.goNamed(AppRoute.registerScreen.name);
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "belum punya akun? registrasi ",
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
