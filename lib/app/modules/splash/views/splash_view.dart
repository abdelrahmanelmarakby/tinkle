import 'package:ease/ease.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinkle/app/modules/Settings/views/settings_view.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return EaseSplashScreen(
        homePage: SettingsView(),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xff045681),
        logo: Image.asset(
          "assets/logo.png",
          fit: BoxFit.contain,
        ),
        slogan: EaseTxt(
          "Offers Notification App",
          color: Colors.white,
          size: 18,
        ));
  }
}
