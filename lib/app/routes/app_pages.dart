import 'package:get/get.dart';

import '../modules/Settings/views/settings_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/offers/views/offers_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => OffersView(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
  ];
}
