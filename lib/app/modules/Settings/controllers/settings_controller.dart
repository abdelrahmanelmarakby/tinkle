import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
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
  final otp = TextEditingController();
  Future getData() async {
    countries = await SettingsAPI.getCountries() as List<String>;
    cities = SettingsAPI.getCities() as List<String>;
    areas = SettingsAPI.getAreas() as List<String>;
  }
}
