import 'package:go_router/go_router.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/screen/login_screen.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/screen/register_screen.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/screen/splash_screen.dart';
import 'package:sims_ppob_abim/feature/history/presentation/screen/history_page.dart';
import 'package:sims_ppob_abim/feature/home/presentation/screen/home_screen.dart';
import 'package:sims_ppob_abim/feature/payment/presentation/screen/payment_screen.dart';
import 'package:sims_ppob_abim/feature/profile/presentation/screen/account_setting_screen.dart';
import 'package:sims_ppob_abim/feature/profile/presentation/screen/profile_screen.dart';
import 'package:sims_ppob_abim/feature/topup/presentation/screen/topup_screen.dart';

enum AppRoute {
  splashScreen,
  loginScreen,
  registerScreen,
  homeScreen,
  paymentScreen,
  topupScreen,
  historyScreen,
  profileScreen,
  accountSettingScreen,
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splashScreen.name,
      builder: (context, state) {
        return const SplashScreen();
      },
      routes: [
        GoRoute(
          path: 'login',
          name: AppRoute.loginScreen.name,
          builder: (context, state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'register',
          name: AppRoute.registerScreen.name,
          builder: (context, state) {
            return const RegisterScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: AppRoute.homeScreen.name,
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'payment',
          name: AppRoute.paymentScreen.name,
          builder: (context, state) {
            final param = state.extra! as PaymentParam;
            return PaymentScreen(
              paymentParam: param,
            );
          },
        ),
        GoRoute(
          path: '/topup',
          name: AppRoute.topupScreen.name,
          builder: (context, state) {
            return const TopupScreen();
          },
        ),
        GoRoute(
          path: '/history',
          name: AppRoute.historyScreen.name,
          builder: (context, state) {
            return const HistoryScreen();
          },
        ),
        GoRoute(
          path: '/profile',
          name: AppRoute.profileScreen.name,
          builder: (context, state) {
            return const ProfileScreen();
          },
          routes: [
            GoRoute(
              path: 'account-setting',
              name: AppRoute.accountSettingScreen.name,
              builder: (context, state) {
                return const AccountSettingScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
