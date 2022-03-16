import 'package:ease/ease.dart';
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
              itemBuilder: (context, index) => CategoryListItem(
                name: categories.data![index].title ?? "N/A",
                ImageUrl: categories.data![index].logo ?? "N/A",
              ),
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
  const CategoryListItem({Key? key, this.name = "", this.ImageUrl = ""})
      : super(key: key);

  final String name;
  final String ImageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: EaseTxt(name),
      trailing: Image.network(ImageUrl),
      onTap: () {
        Get.toNamed('/category');
      },
    );
  }
}
