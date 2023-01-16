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
  List<BundleModel> myBundles = [];
  bool isBundleLoading = false;
  bool isCourseLoading = false;
  bool isBuyingCourse = false;
  bool isBundleCoursesLoading = false;
  bool isCashOndeliveryLoading = false;
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

  setBundleCoursesLoading(bool isLoading) {
    isBundleCoursesLoading = isLoading;
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
      if (courses.isNotEmpty) {
        for (var element in bundles) {
          if (element.sId == id) {
            log("WAA ISKU MID");
            setBundleCoursesLoading(false);
            return;
          } else {
            log("WAA la WAAYE MID");
            setBundleCoursesLoading(true);
            courses = await CoursesProvider().getBundleCourses(id: id);
            update();
          }
        }
      } else {
        setBundleCoursesLoading(true);
        courses = await CoursesProvider().getBundleCourses(id: id);
        print("THE DATA: $courses");
        update();
      }
    } catch (e) {
      log(e.toString(), name: "Get Bundle Courses ERROR");
    }
    setBundleCoursesLoading(false);
  }

  buyCourse({required String bundleId, required double price}) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isBuyingCourse = true;
        update();
        String phone = numberValue.substring(1);
        bool isCashOnDelivery = isSelectedCashOnDelivery == 1;
        if (isCashOnDelivery) {
          await cashOndelivery(price: price.toString(), id: bundleId);
        } else {
          var data = await CoursesProvider()
              .buyCourse(bundleId: bundleId, phone: phone);
          Get.back();
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

  cashOndelivery({required String price, required String id}) async {
    try {
      // isCashOndeliveryLoading = true;
      // update();
      final user = Get.find<UserController>();
      String phone = numberValue.value.substring(1);
      var data = await CoursesProvider().cashOnDelivery(
          phone: phone,
          price: price,
          id: id,
          userId: user.user.dDoc?.sId ?? "");
      user.checkToken();
      Get.back();
      print(data);
      erroMessage(data['message']);
      update();
    } catch (e) {
      log(e.toString(), name: "Cash on delivery");
      erroMessage(e.toString());
    }
    // isCashOndeliveryLoading = false;
    // update();
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

  getMyCourses() {
    try {
      final user = Get.find<UserController>();
      if (user.hasData) {
        if (bundles.isNotEmpty) {
          for (var element in bundles) {
            for (var u in user.user.dDoc?.bundles ?? []) {
              if (element.sId == u) {
                myBundles.add(element);
              }
            }
          }
          update();
        } else {
          myBundles = [];
          update();
        }
      } else {
        myBundles = [];
        update();
      }
    } catch (e) {
      log(e.toString(), name: "Get My Courses ERROR");
    }
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
