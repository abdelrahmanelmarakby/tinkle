import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tinkle/app/data/models/categories_model.dart';

class CompanyApis {
  static Future<CategoriesModel> getCompanies() async {
    Dio dio = new Dio();
    dio.interceptors.add(dioLoggerInterceptor);

    try {
      Response response = await dio.get('https://egyptsystem.com/api/company');
      return CategoriesModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
    }
    return CategoriesModel();
  }

  static Future getOffersFromCompany(int id) async {
    Dio dio = new Dio();
    dio.interceptors.add(dioLoggerInterceptor);

    try {
      Response response =
          await dio.get('https://egyptsystem.com/api/company-offers/$id');
      return 0;
      //  return CategoriesModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
    }
    // return CategoriesModel();
  }
}
