import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

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
//third page variables
  TextEditingController phone = TextEditingController();

  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  bool isPhoneOk = false;
  final otp = TextEditingController();

  var onTapRecognizer;

  StreamController<ErrorAnimationType>? errorController;

  RxBool hasError = false.obs;
  RxString currentText = "".obs;
}
