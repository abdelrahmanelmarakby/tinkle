import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinkle/app/data/api/categories_apis.dart';
import 'package:tinkle/app/data/api/company_apis.dart';
import 'package:tinkle/app/data/models/categories_model.dart';
import 'package:tinkle/app/modules/Companies/views/company_offers_view.dart';
import 'package:tinkle/app/modules/categories/views/categories_view.dart';

import '../controllers/offers_controller.dart';

class CompanyView extends GetView<CompanyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CompanyApis.getCompanies(),
        builder:
            (BuildContext context, AsyncSnapshot<CategoriesModel> snapshot) {
          if (snapshot.data != null) {
            CategoriesModel? categories = snapshot.data;
            return ListView.builder(
              itemCount: categories!.data?.length ?? 0,
              itemBuilder: (context, index) => CategoryListItem(
                  name: categories.data![index].title ?? "N/A",
                  ImageUrl: categories.data![index].logo ?? "N/A",
                  OnTap: () => Get.to(() =>
                      CompanyOffersView(categories.data![index].id!.toInt()))),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
