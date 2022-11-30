
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:money_formatter/money_formatter.dart';

import '../data/models/course_model.dart';
import '../modules/courses/controllers/courses_controller.dart';
import '../modules/favorites/controllers/favorites_controller.dart';


class CourseCardMain extends StatelessWidget {
  CourseCardMain({Key? key, required this.course}) : super(key: key);
  final CourseModel course;
  Lessons? lesson;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 12.0),
      width: Get.height,
      height: Get.width * 0.3 + 20,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(1, 1),
          )
        ],
      ),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          //highlightColor: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            // Get.to(
            //   () => CourseDetailView(course: course, lesson),
            // );
          },
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 12.0, bottom: 12.0, top: 12.0, right: 12.0),
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    width: Get.width * 0.3,
                    height: Get.height * 0.3,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Get.theme.primaryColor, width: 0.4),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: course.image != null
                          ? ExtendedImage.network(
                              fit: BoxFit.cover,
                              cache: true,
                              course.image!.location ?? '',
                            )
                          : ExtendedImage.asset(
                              'assets/logos/7.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            course.name ?? 'No Name',
                            style: TextStyle(
                                color: Theme.of(context).hoverColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                CupertinoIcons.person_2,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 8.0, top: 3.0),
                                child: Text(
                                  course.instructor != null
                                      ? course.instructor!.username!
                                      : 'No Instructor',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                CupertinoIcons.book,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 8.0, top: 0.0),
                                child: Text(
                                  course.sections != null
                                      ? "${lessonsLength(course)} Lessons"
                                      : "No Lessons",
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                CupertinoIcons.money_dollar_circle,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: GetBuilder<CoursesController>(
                                  builder: (cont) {
                                if (/*cont.isPaidCourse(course)*/ false){}/* {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        left: 8.0, top: 0.0),
                                    child: const Text(
                                      'Paid',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                } */ else {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        left: 8.0, top: 0.0),
                                    child: Text(
                                      price(course),
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 5,
                  right: 5,
                  child: GetBuilder<FavoritesController>(builder: (cont) {
                    return LikeButton(
                      onTap: (isLiked) async {
                        if (!isLiked) {
                         // cont.saveFavoriteCourse(course);
                          return true;
                        } else {
                         // cont.removeFavoriteCourse(course);
                          return false;
                        }
                      },
                      
                      //isLiked: cont.checkCourseInFavorite(course),
                      size: 16,
                      likeBuilder: (bool isLiked) {
                        if (!isLiked) {
                          return const Icon(
                            CupertinoIcons.heart,
                            size: 16,
                          );
                        }
                        return null;
                      },
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

int lessonsLength(CourseModel course) {
  int length = 0;
  if (course.sections!.isNotEmpty) {
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
