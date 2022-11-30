import 'package:aqoon_bile/app/constants.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:like_button/like_button.dart';
import 'package:money_formatter/money_formatter.dart';

import '../data/models/course_model.dart';
import '../modules/courses/controllers/courses_controller.dart';
import '../modules/favorites/controllers/favorites_controller.dart';

// ignore: must_be_immutable
class CourseCard extends StatelessWidget {
  CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);
  final CourseModel course;
  Lessons? lesson;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8),
          width: Get.width * 0.5,
          height: Get.height * 0.3 + 10,
          decoration: BoxDecoration(
            color: Get.theme.cardColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
          ),
          child: Material(
            color: Get.theme.cardColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: InkWell(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              onTap: () {},
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        child: ExtendedImage.network(
                          course.image?.location ??
                              "https://www.vocaleurope.eu/wp-content/uploads/no-image.jpg",
                          cache: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 8,right: 8),
                            child: Text(
                              course.name ??
                                  "The Complete Flutter Course With Firebase",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8, left: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(IconlyLight.bag, size: 12),
                                Expanded(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(left: 8, top: 2),
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
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(CupertinoIcons.book, size: 12),
                                Expanded(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(left: 8, top: 2),
                                    child: const Text(
                                      '20 Videos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 8.0),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GetBuilder<CoursesController>(builder: (cont) {
                      if (/*cont.isPaidCourse(course)*/ false) {
                        return Container(
                          margin: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                      top: 2.0,
                                      bottom: 2.0),
                                  decoration: BoxDecoration(
                                      color: kSecondaryLightColor,
                                      borderRadius:
                                          BorderRadius.circular(35.0)),
                                  child: const Text(
                                    'Continue Watching',
                                    style: TextStyle(
                                        fontSize: 8.0, color: kPrimaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        if (course.paid == false) {
                          return Container(
                            margin: const EdgeInsets.only(left: 8, bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: 'Free',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Get.theme.hoverColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(left: 8, bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: "Starts",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Get.theme.hoverColor,
                                          fontWeight: FontWeight.w300),
                                      children: [
                                        TextSpan(
                                          text: price(course),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Get.theme.hoverColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      color: kSecondaryLightColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text(
                                    "Best Seller",
                                    style: TextStyle(
                                        fontSize: 6, color: kPrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            padding: const EdgeInsets.only(left: 3.0),
            margin: const EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
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
                  isLiked: /*cont.checkCourseInFavorite(course)*/ true,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(8.0),
                  circleColor:
                      const CircleColor(start: Colors.red, end: Colors.cyan),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.pink),
                  size: 16,
                  likeBuilder: (bool isLiked) {
                    if (!isLiked) {
                      return Icon(
                        IconlyLight.heart,
                        size: 16,
                        color: Get.theme.hoverColor,
                      );
                    }
                    return null;
                  },
                );
              }),
            ),
          ),
        ),
      ],
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
      return " Free";
    }
  }
}

String parseMoney(String money) {
  MoneyFormatter price = MoneyFormatter(amount: double.parse(money));
  return price.output.compactSymbolOnLeft;
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
