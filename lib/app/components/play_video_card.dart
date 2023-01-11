import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';


import '../constants.dart';
import '../data/models/course_model.dart';
import '../modules/courses/controllers/courses_controller.dart';
import '../modules/courses/views/course_detail_view.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({
    Key? key,
    required this.lesson,
    required this.course,
    required this.section,
    this.isPaid = false,
  }) : super(key: key);
  final Lessons lesson;
  final CourseModel course;
  final Sections section;
  final bool isPaid;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesController>(builder: (cont) {
      bool isSelected = cont.currentSelectedVideo == lesson.sId;
      return Container(
        margin: const EdgeInsets.only(left: 8, bottom: 5, top: 5),
        decoration: BoxDecoration(
            color: isSelected ? kSecondaryLightColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          enabled: course.isAppleReview == true ? true : isPaid,
          onTap: () {
            cont.updateCurrentVideo(lesson.sId ?? "");
            cont.updateCurrentSection(section.sId ?? "");
            Navigator.pushReplacement(
              Get.context!,
              PageRouteBuilder(
                pageBuilder: (c, a, w) => CourseDetailView(
                  lesson,
                  course: course,
                ),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          },
          //enabled:lesson.freePreview==true ,
          leading: course.isAppleReview == true
              ?  Icon(
                 isSelected? Icons.pause:IconlyBold.play,
                  color: kPrimaryColor,
                )
              : Icon(
                  isPaid == false
                      ? IconlyBold.lock
                      : isSelected
                          ? Icons.pause
                          : lesson.freePreview != true
                              ? IconlyBold.play
                              : IconlyBold.play,
                  color: isPaid == true
                      ? lesson.freePreview != true
                          ? kPrimaryColor
                          : kPrimaryColor
                      : Colors.grey,
                ),
          title: Text(lesson.title ?? ""),
          trailing: Text(lesson.duration ?? ""),
        ),
      );
    });
  }
}
