import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/bundle_card.dart';
import '../controllers/courses_controller.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('My Courses',style: TextStyle(
            color: Theme.of(context).hoverColor
          ),),
           centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).hoverColor),
        ),
        body: Column(
          children: [
            Expanded(child: GetBuilder<CoursesController>(
              builder: (cont) {
                if (cont.isBundleLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (cont.myBundles.isEmpty) {
                  return const Center(
                    child: Text("You don't have courses"),
                  );
                } else {
                  return GridView.builder(
                    itemCount: cont.myBundles.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Get.height * 0.3 + 10,
                    ),
                    itemBuilder: (context, index) => BundleCard(
                      bundle: cont.myBundles[index],
                    ),
                  );
                }
              },
            )),
          ],
        ));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Get.find<CoursesController>().getMyCourses();
  }
}
