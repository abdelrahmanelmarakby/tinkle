import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinkle/app/data/api/settings_apis.dart';

class SettingsController extends GetxController {
  //first page variables
  PageController pageController = PageController();
  RxString langCheckBox = "en-US".obs;
  Locale lang = Locale('en-US');
//second page variables
  late RxString city = "".obs;
  late RxString country = "".obs;
  late RxString area = "".obs;
  //list of countries
  RxList<String> countries = [
    "Egypt",
    "United States",
    "United Kingdom",
    "Canada",
    "Australia",
    "New Zealand",
    "South Africa",
    "Saudi Arabia",
    "Kuwait",
    "Oman",
    "Qatar",
    "Bahrain",
    "Jordan",
  ].obs;

  //list of cities in egypt
  RxList<String> cities = [
    "Cairo",
    "Alexandria",
    "Giza",
    "Port Said",
    "Suez",
    "Red Sea",
    "Aswan",
    "Luxor",
    "Ismailia",
    "Beni Suef",
    "Sohag",
    "Shibin El Kom",
    "Qena",
    "Asyut",
    "Minya",
    "Damanhur",
    "Zagazig",
    "Damietta",
    "Asyut",
  ].obs;
  RxList<String> areas = ["mansoura"].obs;
//third page variables
  TextEditingController phone = TextEditingController();

  var isLoading = false.obs;
  TextEditingController otp = TextEditingController();
  Future getData() async {
    Future.delayed(Duration(seconds: 5));
    return 0;
  }
}
