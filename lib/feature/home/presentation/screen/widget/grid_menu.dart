import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/router/page_router.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/feature/home/presentation/providers/home_providers.dart';
import 'package:sims_ppob_abim/feature/payment/presentation/screen/payment_screen.dart';

class GridMenu extends StatefulWidget {
  const GridMenu({super.key});

  @override
  State<GridMenu> createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProviders>(context, listen: false).getServices();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProviders>(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 40.h,
      ),
      shrinkWrap: true,
      itemCount: controller.services.length,
      itemBuilder: (context, index) {
        final service = controller.services[index];
        return InkWell(
          onTap: () {
            context.goNamed(
              AppRoute.paymentScreen.name,
              extra: PaymentParam(
                services: service,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                service.serviceIcon,
                width: 100.w,
                height: 100.w,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) =>
                    Image.asset(
                  AppAssets.listIcon[index],
                ),
              ),
              SizedBox(height: 10.h),
              Flexible(
                child: Text(
                  service.serviceCode.split('_').join(' '),
                  style: AppTextStyle.body().copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
