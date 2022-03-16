import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinkle/app/data/api/categories_apis.dart';
import 'package:tinkle/app/modules/categories/controllers/categories_controller.dart';

class CategoryOffersView extends GetView<CategoriesController> {
  const CategoryOffersView(this.CategoryId, {Key? key}) : super(key: key);
  final int CategoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CategoriesApis.getOffersFromCategory(CategoryId),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Container();
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
