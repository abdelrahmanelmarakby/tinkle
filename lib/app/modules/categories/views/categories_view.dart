import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinkle/app/data/api/categories_apis.dart';
import 'package:tinkle/app/data/models/categories_model.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CategoriesApis.getCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<CategoriesModel> snapshot) {
          if (snapshot.data != null) {
            CategoriesModel? categories = snapshot.data;
            return ListView.builder(
              itemCount: categories!.data!.length,
              itemBuilder: (context, index) => CategoryListItem(),
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

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
