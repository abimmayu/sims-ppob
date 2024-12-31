import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/core/widgets/bottom_nav_bar.dart';
import 'package:sims_ppob_abim/core/widgets/saldo.dart';
import 'package:sims_ppob_abim/feature/home/presentation/screen/widget/banner_carousel.dart';
import 'package:sims_ppob_abim/feature/home/presentation/screen/widget/grid_menu.dart';
import 'package:sims_ppob_abim/feature/home/presentation/screen/widget/head_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 1500.h,
              child: ListView(
                padding: EdgeInsets.fromLTRB(50.w, 50.w, 50.w, 0),
                children: [
                  const HeadProfile(),
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    "Selamat datang,",
                    style: AppTextStyle.body().copyWith(
                      fontSize: 82.sp,
                    ),
                  ),
                  Text(
                    "Kristanto Wibowo",
                    style: AppTextStyle.title().copyWith(
                      fontSize: 82.sp,
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  SaldoWidget(
                    isObsecure: isObsecure,
                    isHome: true,
                    onTap: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: const GridMenu(),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 500.h,
              padding: EdgeInsets.only(left: 50.w),
              child: const BannerCarousel(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
