import 'package:ease/ease.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinkle/app/data/api/categories_apis.dart';
import 'package:tinkle/app/data/models/categories_model.dart';
import 'package:tinkle/app/modules/categories/views/Category_offers_view.dart';

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
              itemCount: categories!.data?.length ?? 0,
              itemBuilder: (context, index) => CategoryListItem(
                  name: categories.data![index].title ?? "N/A",
                  ImageUrl: categories.data![index].logo ?? "N/A",
                  OnTap: () => Get.to(() =>
                      CategoryOffersView(categories.data![index].id!.toInt()))),
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
  const CategoryListItem(
      {Key? key, this.name = "", this.ImageUrl = "", this.OnTap})
      : super(key: key);

  final String name;
  final String ImageUrl;
  final void Function()? OnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    ImageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                EaseTxt(
                  name,
                  size: 20,
                  weight: FontWeight.bold,
                ),
              ],
            )),
      ),
    );
  }
}
