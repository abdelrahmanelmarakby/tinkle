import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:tinkle/app/data/api/Settings_Apis.dart';

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
    return 0;
    await SettingsAPI()
        .getCountries()
        .then((value) => countries = value as List<String>);
    await SettingsAPI()
        .getCities()
        .then((value) => cities = value as List<String>);
    await SettingsAPI()
        .getAreas()
        .then((value) => areas = value as List<String>);
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
