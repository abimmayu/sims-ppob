import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/feature/home/presentation/providers/home_providers.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProviders>(context, listen: false).getBanner();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProviders>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Temukan promo menarik",
          style: AppTextStyle.subtitle(),
        ),
        SizedBox(height: 50.h),
        SizedBox(
          height: 400.h,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.banners.length,
            itemBuilder: (context, index) {
              final item = controller.banners[index];
              return Image.network(
                item.bannerImage,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  AppAssets.listBanner[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
