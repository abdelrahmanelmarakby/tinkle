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
  //list of countries
  List<String> countries = [
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
  ];

  //list of cities in egypt
  List<String> cities = [
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
  ];
  List<String> areas = [];
//third page variables
  TextEditingController phone = TextEditingController();

  var isLoading = false.obs;
  TextEditingController otp = TextEditingController();
  Future<int> getData() async {
    Future.wait([
      SettingsAPI()
          .getCountries()
          .then((value) => countries = value as List<String>),
      SettingsAPI().getCities().then((value) => cities = value as List<String>),
      SettingsAPI().getAreas().then((value) => areas = value as List<String>)
    ]);

    return 0;
  }

  @override
  void dispose() {
    pageController.dispose();
    phone.dispose();
    otp.dispose();

    super.dispose();
  }
}
