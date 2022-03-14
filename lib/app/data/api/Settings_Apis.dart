//get all cities from the api and save them in the list of cities

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinkle/app/data/models/area_model.dart';
import 'package:tinkle/app/data/models/cities_model.dart';
import 'package:tinkle/app/data/models/country_model.dart';
import 'package:dio_logger/dio_logger.dart';

class SettingsAPI {
//get all countries from the api and save them in the list of countries
  Future<List<String?>> getCountries() async {
    Dio dio = Dio();
    dio.interceptors.add(dioLoggerInterceptor);
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
    }

    return [];
  }

//get all citys from the api and save them in the list of citys
  Future<List<String?>> getCities({String? CountryID}) async {
    Dio dio = Dio();
    dio.interceptors.add(dioLoggerInterceptor);
    try {
      final response = await dio.post(
        "https://egyptsystem.com/api/citys",
      );
      final parsed = CityModel.fromJson(response.data);
      return parsed.data!.map((e) => e.title).toList();
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
    }
    return [];
  }

//get all areas from the api and save them in the list of areas
  Future<List<String?>> getAreas({String? CityID}) async {
    Dio dio = Dio();
    dio.interceptors.add(dioLoggerInterceptor);
    try {
      final response = await dio.post(
        "https://egyptsystem.com/api/areas",
      );
      final parsed = AreaModel.fromJson(response.data);
      return parsed.data!.map((e) => e.title).toList();
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
    }
    return [];
  }

//send otp code to the phone number and return the otp code
  static Future<void> sendOtp({String phoneNumber = ""}) async {
    Dio dio = Dio();
    dio.interceptors.add(dioLoggerInterceptor);
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
    dio.interceptors.add(dioLoggerInterceptor);
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
