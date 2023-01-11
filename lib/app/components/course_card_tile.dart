import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';


import '../constants.dart';
import '../data/models/course_model.dart';
import '../modules/courses/controllers/courses_controller.dart';
import '../modules/courses/views/course_detail_view.dart';


class CourseCardTile extends StatelessWidget {
  CourseCardTile({
    Key? key,
    required this.course,
  }) : super(key: key);
  final CourseModel course;
  Lessons? lesson;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:Get.height*0.1+20,
      margin: const EdgeInsets.only(top: 12, left: 16, right: 5),
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Material(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
          ),
          onTap: () {
            Get.to(
              () => CourseDetailView(course: course, lesson),
            );
          },
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ExtendedImage.network(
                        course.image?.location ?? "https://www.vocaleurope.eu/wp-content/uploads/no-image.jpg",
                        cache: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8, top: 5),
                        child: Text(
                          course.name ?? "",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(CupertinoIcons.person, size: 12),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 8, top: 2),
                                child: Text(
                                  course.instructor?.username ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8.0),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            GetBuilder<CoursesController>(builder: (cont) {
                              if (/*cont.isPaidCourse(course)*/false) {
                             /*   return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child:  Text(
                                        LocaleKeys.paid.tr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                );
                  
                  
                  */          } 
                            else {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: Text(
                                        price(course),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                );
                              }
                            }),
                            Positioned.fill(
                              child: Container(
                                margin: const EdgeInsets.only(top: 5, left: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(CupertinoIcons.book, size: 12),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 8, top: 2),
                                        child:  Text(
                                          '${lessonsLength(course)} Lessons',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 8.0),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String price(CourseModel course) {
  if (course.planes != null) {
    if (course.planes!.isNotEmpty) {
      return parseMoney(course.planes?.first.price ?? "");
    } else {
      return parseMoney(course.price ?? "");
    }
  } else {
    if (course.paid == true) {
      return course.price ?? "";
    } else {
      return "Free";
    }
  }
}

String parseMoney(String money) {
  MoneyFormatter price = MoneyFormatter(amount: double.parse(money));
  return price.output.compactSymbolOnLeft;
}
int lessonsLength(CourseModel course) {
  int length = 0;
  if (course.sections?.isNotEmpty??false) {
    for (var element in course.sections!) {
      if (element.lessons!.isNotEmpty) {
        length += element.lessons!.length;
      }
    }
  } else {
    length = 0;
  }
  return length;
}
