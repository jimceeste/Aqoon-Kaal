import 'package:aqoon_bile/app/components/bundle_card.dart';
import 'package:aqoon_bile/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.favorites.tr,
            style: TextStyle(color: Theme.of(context).hoverColor),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).cardColor,
          iconTheme: IconThemeData(color: Theme.of(context).hoverColor),
        ),
        body: Column(
          children: [
            Expanded(child: GetBuilder<FavoritesController>(
              builder: (cont) {
                if (cont.favoriteCourses.isEmpty) {
                  return const Center(child: Text("No Favorites"));
                } else {
                  return GridView.builder(
                    itemCount: cont.favoriteCourses.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Get.height * 0.3 + 10,
                    ),
                    itemBuilder: (context, index) => BundleCard(
                      bundle: cont.favoriteCourses[index],
                    ),
                  );
                }
              },
            ))
          ],
        ));
  }
}
