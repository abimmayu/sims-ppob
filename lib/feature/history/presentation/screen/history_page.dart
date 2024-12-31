import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/core/widgets/bottom_nav_bar.dart';
import 'package:sims_ppob_abim/core/widgets/custom_app_bar.dart';
import 'package:sims_ppob_abim/core/widgets/saldo.dart';
import 'package:sims_ppob_abim/feature/history/presentation/providers/history_providers.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        Provider.of<HistoryProviders>(context, listen: false).getHistory();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HistoryProviders>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: "History",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SaldoWidget(
                onTap: () {},
                isObsecure: false,
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Transaksi",
                style: AppTextStyle.title().copyWith(fontSize: 48.sp),
              ),
              controller.history.isEmpty
                  ? childrenEmpty()
                  : Expanded(
                      child: childrenHistory(controller),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 2,
        ),
      ),
    );
  }

  Widget childrenEmpty() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
          ),
          Text(
            "Maaf tidak ada history transaksi hari ini",
            style: AppTextStyle.body().copyWith(fontSize: 36.sp),
          ),
        ],
      ),
    );
  }

  Widget childrenHistory(HistoryProviders controller) {
    final data = controller.history;
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: const Column(),
        );
      },
    );
  }
}
