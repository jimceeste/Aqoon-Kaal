import 'package:aqoon_bile/app/data/models/bundel_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants.dart';


class FavoritesController extends GetxController {
  final box = GetStorage();
  final List<BundleModel> favoriteCourses = [];
  int get length => favoriteCourses.length;
  bool checkCourseInFavorite(BundleModel course) {
    bool isLiked = false;
    for (BundleModel item in favoriteCourses) {
      if (item.sId == course.sId) {
        isLiked = true;
      }
    }
    return isLiked;
  }

  Future<void> getFavoriteCourses() async {
    if (box.hasData(kFavoriteCourses)) {
      var data = await box.read(kFavoriteCourses);

      for (var v in data) {
        favoriteCourses.add(
          BundleModel.fromJson(Map<String, dynamic>.from(v)),
        );
      }
      update();
    }
  }

  Future<void> removeFavoriteCourse(BundleModel course) async {
    favoriteCourses.removeWhere((e) => e.sId == course.sId);
    update();
    final courses = favoriteCourses.map((v) => v.toJson()).toList();
    await box.remove(kFavoriteCourses);
    await box.write(kFavoriteCourses, courses);
  }

  Future<void> saveFavoriteCourse(BundleModel course) async {
    favoriteCourses.add(course);
    update();
    final courses = favoriteCourses.map((v) => v.toJson()).toList();
    await box.write(kFavoriteCourses, courses);
  }

  /// ############################## MAIN ################################### ///
  @override
  void onInit() {
    super.onInit();
    getFavoriteCourses();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

}
