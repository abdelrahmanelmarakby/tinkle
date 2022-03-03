//get all cities from the api and save them in the list of cities
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinkle/app/data/models/country_model.dart';

class SettingsAPI {
//get all countries from the api and save them in the list of countries
  static Future<List<String?>> getCountries() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    try {
      final response = await dio.post(
        "https://egyptsystem.com/api/countrys",
      );
      final parsed = CountryModel.fromJson(response.data);
      return parsed.data!.map((e) => e.title).toList();
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
      return [];
    }
  }

//get all citys from the api and save them in the list of citys
  static Future<List<String?>> getCities({String CountryID = "20"}) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    try {
      final response =
          await dio.post("https://egyptsystem.com/api/citys", data: {
        "country": CountryID,
      });
      final parsed = CountryModel.fromJson(response.data);
      return parsed.data!.map((e) => e.title).toList();
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
      return [];
    }
  }

//get all areas from the api and save them in the list of areas
  static Future<List<String?>> getAreas({String CityID = "20"}) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    try {
      final response =
          await dio.post("https://egyptsystem.com/api/areas", data: {
        "city": CityID,
      });
      final parsed = CountryModel.fromJson(response.data);
      return parsed.data!.map((e) => e.title).toList();
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
      return [];
    }
  }

//send otp code to the phone number and return the otp code
  static Future<void> sendOtp({String phoneNumber = ""}) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    try {
      final response =
          await dio.post("https://egyptsystem.com/api/user/register", data: {
        "mobile": phoneNumber,
      });
      final parsed = CountryModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
    }
  }

  //verify the otp code
  static Future<void> verifyOtp(
      {String phoneNumber = "", String otpCode = ""}) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (log) {
          print(log);
        }));
    try {
      final response = await dio.post(
        "https://egyptsystem.com/api/confirm/$phoneNumber/$otpCode",
      );
      //final parsed = CountryModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
    }
  }
}
