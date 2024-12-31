// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/router/page_router.dart';
import 'package:sims_ppob_abim/core/utils/text_style/number_currency.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/core/widgets/bottom_nav_bar.dart';
import 'package:sims_ppob_abim/core/widgets/button_filled.dart';
import 'package:sims_ppob_abim/core/widgets/custom_app_bar.dart';
import 'package:sims_ppob_abim/core/widgets/saldo.dart';
import 'package:sims_ppob_abim/feature/topup/presentation/providers/topup_provider.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({super.key});

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();

  List<int> listAmount = [
    10000,
    20000,
    50000,
    100000,
    250000,
    500000,
  ];

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TopupProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: "Top Up",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 100.w),
        children: [
          SaldoWidget(
            onTap: () {},
            isObsecure: false,
          ),
          SizedBox(
            height: 100.h,
          ),
          Text(
            "Silahkan masukan",
            style: AppTextStyle.body().copyWith(
              fontSize: 60.sp,
            ),
          ),
          Text(
            "nominal Top Up",
            style: AppTextStyle.subtitle().copyWith(
              fontSize: 60.sp,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Form(
            key: formKey,
            child: TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.credit_card_outlined),
                hintText: "Masukkan nominal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final textValue = int.parse(value.replaceAll(',', ''));
                  if (textValue > 0) {
                    setState(
                      () {
                        isFilled = true;
                        amountController.value = TextEditingValue(
                          text: NumberFormat.decimalPattern('id')
                              .format(textValue),
                          selection: TextSelection.collapsed(
                            offset: NumberFormat.decimalPattern('id')
                                .format(textValue)
                                .length,
                          ),
                        );
                      },
                    );
                  }
                } else {
                  setState(
                    () {
                      isFilled = false;
                    },
                  );
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nominal tidak boleh kosong";
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CustomInputFormatter(),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 100.h,
                mainAxisSpacing: 50.h,
                crossAxisSpacing: 20.h,
              ),
              itemCount: listAmount.length,
              itemBuilder: (context, index) {
                final NumberFormat format = NumberFormat.currency(
                  symbol: 'Rp ',
                  locale: "id_ID",
                  decimalDigits: 0,
                );
                final formattedNumber = format.format(
                  listAmount[index],
                );
                return InkWell(
                  onTap: () {
                    setState(() {
                      amountController.value = TextEditingValue(
                        text: NumberFormat.decimalPattern('id')
                            .format(listAmount[index]),
                        selection: TextSelection.collapsed(
                          offset: NumberFormat.decimalPattern('id')
                              .format(listAmount[index])
                              .length,
                        ),
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: AppColor.greyColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        formattedNumber,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          amountController.text != ''
              ? ButtonFilled(
                  text: "Top Up",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(child: dialogConfirmation(controller));
                        },
                      );
                    }
                  },
                )
              : ButtonFilled(
                  text: "Top Up",
                  onPressed: () {},
                  color: AppColor.greyColor,
                ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
      ),
    );
  }

  Widget dialogResult({
    required bool isSuccess,
    required TopupProvider controller,
  }) {
    final NumberFormat formatCurrency = NumberFormat.currency(
      symbol: '',
      locale: 'id_ID',
      decimalDigits: 0,
    );
    final formattedNumber = formatCurrency.format(
      int.parse(
        amountController.text.replaceAll('.', ''),
      ),
    );
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: EdgeInsets.all(50.w),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.sizeOf(context).width - 100.w,
        height: 800.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isSuccess ? AppColor.secondaryColor : AppColor.primaryColor,
              ),
              child: Icon(
                isSuccess ? Icons.check : Icons.close,
                color: AppColor.whiteColor,
                size: 150.h,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Top Up sebesar",
              style: AppTextStyle.body().copyWith(
                fontSize: 50.sp,
              ),
            ),
            Text(
              "Rp$formattedNumber",
              style: AppTextStyle.title().copyWith(
                fontSize: 82.sp,
              ),
            ),
            Text(
              isSuccess ? "Berhasil" : "Gagal",
              style: AppTextStyle.body().copyWith(
                fontSize: 50.sp,
              ),
            ),
            TextButton(
              onPressed: () {
                if (mounted) {
                  context.pop();
                  context.goNamed(AppRoute.homeScreen.name);
                }
              },
              child: Text(
                "Kembali ke Beranda",
                style: AppTextStyle.title().copyWith(
                  color: AppColor.primaryColor,
                  fontSize: 36.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dialogConfirmation(TopupProvider controller) {
    final NumberFormat formatCurrency = NumberFormat.currency(
      symbol: '',
      locale: 'id_ID',
      decimalDigits: 0,
    );
    final formattedNumber = formatCurrency.format(
      int.parse(
        amountController.text.replaceAll(
          '.',
          '',
        ),
      ),
    );
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: EdgeInsets.all(50.w),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.sizeOf(context).width - 100.w,
        height: 1100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 200.h,
            ),
            SizedBox(
              height: 100.h,
            ),
            Text(
              "Anda yakin untuk Top Up sebesar",
              style: AppTextStyle.body().copyWith(
                fontSize: 50.sp,
              ),
            ),
            Text(
              "Rp$formattedNumber",
              style: AppTextStyle.title().copyWith(
                fontSize: 82.sp,
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () async {
                    await controller.topup(
                      int.parse(amountController.text.replaceAll('.', '')),
                    );
                    if (controller.isTopupSuccess == true) {
                      log("top up berhasil");
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          if (mounted) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => Center(
                                child: dialogResult(
                                  isSuccess: true,
                                  controller: controller,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    } else if (controller.isTopupSuccess == false) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          if (mounted) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => Center(
                                child: dialogResult(
                                  isSuccess: false,
                                  controller: controller,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                    if (mounted) {
                      context.pop();
                    }
                  },
                  child: Text(
                    "Ya, lanjutkan bayar",
                    style: AppTextStyle.title().copyWith(
                      color: AppColor.primaryColor,
                      fontSize: 36.sp,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "tidak",
                    style: AppTextStyle.body().copyWith(
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 36.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
