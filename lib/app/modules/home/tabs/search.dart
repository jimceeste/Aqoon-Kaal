import 'package:aqoon_bile/app/modules/home/controllers/home_controller.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../components/course_card_tile_main.dart';
import '../../../constants.dart';
import '../../../data/models/course_model.dart';
import '../../courses/controllers/courses_controller.dart';
class Search extends GetView<HomeController> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesController>(builder: (cont) {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: SearchBar<CourseModel>(
                  iconActiveColor: kPrimaryColor,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      wordSpacing: 2,
                      fontWeight: FontWeight.w300),
                  icon: const Icon(IconlyLight.search, color: kPrimaryColor),
                  searchBarController: controller.searchBarController,
                  searchBarPadding: const EdgeInsets.symmetric(horizontal: 10),
                  headerPadding: const EdgeInsets.symmetric(horizontal: 10),
                  listPadding: const EdgeInsets.symmetric(horizontal: 10),
                  searchBarStyle: SearchBarStyle(
                    backgroundColor: Get.isDarkMode
                        ? Theme.of(context).cardColor
                        : Colors.grey.shade200,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onSearch: (text) {
                    return controller.getCourse(text ?? "", cont.courses);
                  },
                  hintText: 'Search Course',
                  onError: (error) => Text('ERROR: ${error.toString()}'),
                  placeHolder: placeHolder(),
                  scrollDirection: Axis.vertical,
                  cancellationWidget: const Text('Cancel'),
                  emptyWidget: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child:
                           FlutterLogo(),
                      ),
                      Text('Oops! not found!')
                    ],
                  )),
                  onCancelled: () {
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    print("Cancelled triggered");
                  },
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 1,
                  onItemFound: (CourseModel? course, int index) {
                    return CourseCardMain(course: course!);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget placeHolder() {
    return GetBuilder<CoursesController>(
      builder: (cont) {
        if (cont.isCourseLoading) {
          return const Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: FlutterLogo(),
            ),
          );
        } else if (cont.courses.isEmpty) {
          return Center(
            child: SizedBox(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: FlutterLogo(),
                ),
                Text('No Courses Found Currently'),
              ],
            )),
          );
        } else {
          return ListView.builder(
            itemCount: cont.courses.length < 2 ? cont.courses.length : 2,
            itemBuilder: ((context, index) =>
                CourseCardMain(
                  course: cont.courses[index],
                )),
          );
        }
      },
    );
  }
}