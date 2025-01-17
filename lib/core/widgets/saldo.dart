import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/feature/topup/presentation/providers/topup_provider.dart';

class SaldoWidget extends StatefulWidget {
  const SaldoWidget({
    super.key,
    this.isHome = false,
    this.isObsecure = true,
    required this.onTap,
  });

  final bool isObsecure;
  final bool isHome;
  final Function() onTap;

  @override
  State<SaldoWidget> createState() => _SaldoWidgetState();
}

class _SaldoWidgetState extends State<SaldoWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TopupProvider>(context, listen: false).getBalance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TopupProvider>(context);

    final NumberFormat formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: '',
    );

    String formattedSaldo = formatCurrency.format(controller.balance ?? 0);
    return Container(
      padding: EdgeInsets.all(50.w),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundSaldo),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Saldo anda",
            style: AppTextStyle.body().copyWith(
              fontSize: 48.sp,
              color: AppColor.whiteColor,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Text(
                "Rp ",
                style: AppTextStyle.title().copyWith(
                  fontSize: 82.sp,
                  color: AppColor.whiteColor,
                ),
              ),
              Text(
                widget.isObsecure ? "******" : formattedSaldo,
                style: AppTextStyle.title().copyWith(
                  fontSize: 82.sp,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          if (widget.isHome)
            InkWell(
              onTap: widget.onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    Text(
                      "Lihat Saldo",
                      style: AppTextStyle.body().copyWith(
                        fontSize: 36.sp,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      widget.isObsecure
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      size: 36.sp,
                      color: AppColor.whiteColor,
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
