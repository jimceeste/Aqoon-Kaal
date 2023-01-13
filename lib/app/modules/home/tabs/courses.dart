import 'package:aqoon_bile/app/modules/courses/controllers/courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/bundle_card.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 25),
          Expanded(child: GetBuilder<CoursesController>(
            builder: (cont) {
              if (cont.isBundleLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (cont.bundles.isEmpty) {
                return Center(child: Text("No Bundles"));
              } else {
                return GridView.builder(
                  itemCount: cont.bundles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Get.height * 0.3 + 10,
                  ),
                  itemBuilder: (context, index) => BundleCard(
                    bundle: cont.bundles[index],
                  ),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
