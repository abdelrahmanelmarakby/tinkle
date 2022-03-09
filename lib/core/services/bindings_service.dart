import 'package:get/get.dart';
import 'package:tinkle/app/modules/Settings/controllers/settings_controller.dart';
import 'package:tinkle/app/modules/home/controllers/home_controller.dart';
import 'package:tinkle/app/modules/offers/controllers/offers_controller.dart';
import 'package:tinkle/app/modules/otp/controllers/otp_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<OffersController>(() => OffersController());
  }
}
