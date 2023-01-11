import 'dart:developer';

import 'package:aqoon_bile/app/constants.dart';
import 'package:aqoon_bile/app/data/models/course_model.dart';
import 'package:aqoon_bile/app/modules/courses/providers/courses_provider.dart';
import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../data/models/bundel_model.dart';

class CoursesController extends GetxController {
  List<CourseModel> courses = [];
  List<BundleModel> bundles = [];
  bool isBundleLoading = false;
  bool isCourseLoading = false;
  bool isBuyingCourse = false;
  bool isBundleCoursesLoading = false;
  String currentSelectedVideo = '';
  String currentSection = '';
  int isSelectedCashOnDelivery = 11;
  PhoneNumber number = PhoneNumber(isoCode: 'SO');
  GlobalKey<FormState> formKey = GlobalKey();
  var numberValue = ''.obs;
  var textFieldController = TextEditingController();
  setBundleLoading() {
    isBundleLoading = !isBundleLoading;
    update();
  }

  updateIselectedCashOndelivery(int index) {
    isSelectedCashOnDelivery = index;
    update();
  }

  setBundleCoursesLoading() {
    isBundleCoursesLoading = !isBundleCoursesLoading;
    update();
  }

  updateCurrentSection(String index) {
    currentSection = index;
    update();
  }

  updateCurrentVideo(String index) {
    currentSelectedVideo = index;
    update();
  }

  bool isPaidCourse(CourseModel course) {
    bool isPaid = false;
    final u = Get.find<UserController>();
    if (u.hasData) {
      if (u.user.dDoc?.courses != null) {
        print("USER COURSES ${u.user.dDoc?.courses}");
        if (u.user.dDoc?.courses?.isNotEmpty ?? false) {
          for (var element in u.user.dDoc?.courses ?? []) {
            if (element.courseId == course.sId) {
              isPaid = true;
            }
          }
        }
      } else {
        isPaid = false;
      }
    } else {
      isPaid = false;
    }
    return isPaid;
  }

  getBundles() async {
    try {
      setBundleLoading();
      bundles = await CoursesProvider().getBundles();
      update();
    } catch (e) {
      log(e.toString(), name: "Ge Bundles Error");
    }
    setBundleLoading();
  }

  getBundleCourses({required String id}) async {
    try {
      setBundleCoursesLoading();
      courses = await CoursesProvider().getBundleCourses(id: id);
      print("THE DATA: $courses");
    } catch (e) {
      log(e.toString(), name: "Get Bundle Courses ERROR");
    }
    setBundleCoursesLoading();
  }

  buyCourse({required String bundleId}) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isBuyingCourse = true;
        update();
        String phone = numberValue.substring(1);
        bool isCashOnDelivery = isSelectedCashOnDelivery == 1;
        if (isCashOnDelivery) {
        } else {
          var data = await CoursesProvider()
              .buyCourse(bundleId: bundleId, phone: phone);

          erroMessage(data);
        }
      } catch (e) {
        log(e.toString(), name: "Buy Course Errror");
        erroMessage(e.toString());
      }
      isBuyingCourse = false;
      update();
    }
  }

  bool isPaidBundle(BundleModel bundle) {
    bool isPaid = false;
    final user = Get.find<UserController>();
    if (user.hasData) {
      if (user.user.dDoc?.bundles != null) {
        print("USER BUNDLES ${user.user.dDoc?.bundles}");
        if (user.user.dDoc?.bundles?.isNotEmpty ?? false) {
          for (var element in user.user.dDoc?.bundles ?? []) {
            if (element == bundle.sId) {
              isPaid = true;
            }
          }
        }
      } else {
        isPaid = false;
      }
    } else {
      isPaid = false;
    }
    return isPaid;
  }
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    getBundles();
  }
}
