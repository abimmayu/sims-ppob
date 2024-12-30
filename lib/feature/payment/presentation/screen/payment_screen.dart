import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/constant/app_assets.dart';
import 'package:sims_ppob_abim/core/constant/app_color.dart';
import 'package:sims_ppob_abim/core/utils/text_style/text_style.dart';
import 'package:sims_ppob_abim/core/widgets/button_filled.dart';
import 'package:sims_ppob_abim/core/widgets/custom_app_bar.dart';
import 'package:sims_ppob_abim/core/widgets/saldo.dart';
import 'package:sims_ppob_abim/feature/home/domain/entitiy/services.dart';
import 'package:sims_ppob_abim/feature/payment/presentation/providers/payment_providers.dart';

class PaymentParam {
  final Services services;

  PaymentParam({
    required this.services,
  });
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.paymentParam});

  final PaymentParam paymentParam;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController amountController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PaymentProviders>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: "PemBayaran",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(50.w),
        children: [
          SaldoWidget(
            saldo: 10000,
            onTap: () {},
            isHome: false,
          ),
          SizedBox(
            height: 200.h,
          ),
          Text("PemBayaran", style: AppTextStyle.subtitle()),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Image.network(
                widget.paymentParam.services.serviceIcon,
                height: 100.h,
              ),
              SizedBox(
                width: 25.w,
              ),
              Text(
                widget.paymentParam.services.serviceName,
                style: AppTextStyle.title(),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Form(
            key: formKey,
            child: TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.credit_card_outlined),
                hintText: "Masukkan nominal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nominal tidak boleh kosong";
                } else if (int.parse(value) !=
                    widget.paymentParam.services.serviceTariff) {
                  return "Harga layanan ini Rp${widget.paymentParam.services.serviceTariff}";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 500.h,
          ),
          ButtonFilled(
            text: "Bayar",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => Center(
                    child: dialogConfirmation(
                      controller,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget dialogConfirmation(PaymentProviders controller) {
    final NumberFormat formatCurrency = NumberFormat.currency(
      symbol: '',
      locale: 'id_ID',
      decimalDigits: 0,
    );
    final formattedNumber = formatCurrency.format(
      int.parse(amountController.text),
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
              "Beli ${widget.paymentParam.services.serviceName.toLowerCase()} senilai",
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
                  onPressed: () {
                    controller.getPayment(
                      'PAYMENT',
                      widget.paymentParam.services.serviceCode,
                      int.parse(amountController.text),
                    );
                    Navigator.pop(context);
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
