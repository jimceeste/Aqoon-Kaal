import 'dart:io';

import 'package:aqoon_bile/app/data/models/bundel_model.dart';
import 'package:aqoon_bile/app/modules/home/tabs/courses.dart';
import 'package:aqoon_bile/app/modules/home/tabs/search.dart';
import 'package:aqoon_bile/app/modules/profile/views/profile_view.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/course_model.dart';
import '../tabs/home.dart';

class HomeController extends GetxController {
  final SearchBarController<BundleModel> searchBarController =
      SearchBarController();
  int index = 0;

  final screens = [
    const Home(),
    const Search(),
    const Courses(),
    const ProfileView()
  ];
  updateIndex(int index) {
    this.index = index;
    update();
  }

  Future<List<BundleModel>> getBundle(
      String text, List<BundleModel> courses) async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<BundleModel> course = [];
    for (int i = 0; i < courses.length; i++) {
      final courseName = courses[i].name?.toLowerCase();

      if (courseName!.contains(text.toLowerCase())) {
        course.add(courses[i]);

        FocusScope.of(Get.context!).requestFocus(FocusNode());
        update();
      }
    }

    return course;
  }

  exit(int i) async {
    if (index == 0) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            content: const Text(
              'Do You Want To Exit ?',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('No'),
              ),
            ],
          );
        },
      );
    } else if (index == 1) {
      updateIndex(0);
    } else if (index == 2) {
      updateIndex(0);
    } else {
      updateIndex(0);
    }

    return Future.value(false);
  }

  // ################################################################### //

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
}
