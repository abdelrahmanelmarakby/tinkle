import 'package:get/get.dart';
import 'package:tinkle/app/modules/Settings/views/settings_view.dart';

import '../modules/home/views/home_view.dart';
import '../modules/offers/views/offers_view.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => OffersView(),
    ),
  ];
}
