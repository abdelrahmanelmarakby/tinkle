import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tinkle/app/data/models/company_model.dart';

class HomeApis {
  static Future<CompanyModel> getCompanies() async {
    Dio dio = new Dio();
    dio.interceptors.add(dioLoggerInterceptor);

    try {
      Response response =
          await dio.get('https://egyptsystem.com/api/companies');
      return CompanyModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.message,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
      );
    }
    return CompanyModel();
  }
}
