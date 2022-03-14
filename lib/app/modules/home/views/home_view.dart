import 'package:animations/animations.dart';
import 'package:ease/ease.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinkle/app/modules/categories/views/categories_view.dart';
import 'package:tinkle/app/modules/offers/views/offers_view.dart';
import 'package:tinkle/core/utils/assets.dart';
import 'package:tinkle/core/utils/color_manger.dart';
import 'package:tinkle/core/utils/values_manger.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          Assets.assetsLogo,
          height: 30,
          width: 30,
          color: ColorsManger.primary,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                closedBuilder: (context, action) => HomeItem(
                  Image: Image.asset(
                    Assets.assetsList,
                    cacheHeight: 128,
                  ),
                  title: "Offers",
                  width: Get.width * .45,
                  height: Get.width * .6,
                ),
                openBuilder: (context, action) => OffersView(),
              ),
              HomeItem(
                Image: Image.asset(
                  Assets.assetsGroup,
                  cacheHeight: 128,
                ),
                title: "Manage senders",
                width: Get.width * .45,
                height: Get.width * .6,
              ),
              OpenContainer(
                closedBuilder: (context, action) => HomeItem(
                  Image: Image.asset(
                    Assets.assetsCategories,
                    cacheHeight: 128,
                  ),
                  title: "Categories",
                  width: Get.width * .45,
                  height: Get.width * .6,
                ),
                openBuilder: (context, action) => CategoriesView(),
              ),
              HomeItem(
                Image: Image.asset(
                  Assets.assetsLocation,
                  cacheHeight: 128,
                ),
                title: "Location offers",
                width: Get.width * .45,
                height: Get.width * .6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem(
      {Key? key,
      required this.Image,
      required this.title,
      this.onTap,
      this.height = 250,
      this.width = 250})
      : super(key: key);
  final Widget Image;
  final String title;
  final double height;
  final double width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: ColorsManger.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image,
            EaseTxt(
              title,
              size: AppSize.size20,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
