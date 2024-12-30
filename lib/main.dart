import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_abim/core/router/page_router.dart';
import 'package:sims_ppob_abim/core/utils/depedency/depedency_injection.dart'
    as di;
import 'package:sims_ppob_abim/feature/auth/presentation/providers/auth_providers.dart';
import 'package:sims_ppob_abim/feature/home/presentation/providers/home_providers.dart';
import 'package:sims_ppob_abim/feature/payment/presentation/providers/payment_providers.dart';

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.di<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.di<HomeProviders>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.di<PaymentProviders>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1080, 2400),
        child: MaterialApp.router(
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          debugShowCheckedModeBanner: false,
          title: 'SIMS PPOB ABIM',
        ),
      ),
    );
  }
}
