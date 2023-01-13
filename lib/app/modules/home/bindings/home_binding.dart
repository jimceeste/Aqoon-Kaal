import 'package:aqoon_bile/app/modules/languages/controllers/languages_controller.dart';
import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../courses/controllers/courses_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<CoursesController>(CoursesController(), permanent: true);
    Get.put<FavoritesController>(FavoritesController(), permanent: true);
     Get.put<LanguagesController>(LanguagesController(), permanent: true);
  }
}
