import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sims_ppob_abim/core/router/page_router.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/core/widgets/logo_vertical.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHome();

    super.initState();
  }

  void _navigateToHome() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (mounted) {
          context.goNamed(
            AppRoute.loginScreen.name,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidgetVertical(
              size: 600.h,
            ),
            SizedBox(height: 200.h),
            Text(
              "Abim Mayu Indra Ardiansah",
              style: AppTextStyle.subtitle(),
            ),
          ],
        ),
      ),
    );
  }
}
