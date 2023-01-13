import 'package:aqoon_bile/app/constants.dart';
import 'package:aqoon_bile/app/data/models/bundel_model.dart';
import 'package:aqoon_bile/app/modules/courses/controllers/courses_controller.dart';
import 'package:aqoon_bile/app/modules/courses/views/bundle_courses_view.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:like_button/like_button.dart';
import 'package:money_formatter/money_formatter.dart';

import '../../generated/locales.g.dart';
import '../data/models/course_model.dart';
import '../modules/favorites/controllers/favorites_controller.dart';

// ignore: must_be_immutable
class BundleCard extends StatelessWidget {
  BundleCard({
    Key? key,
    required this.bundle,
  }) : super(key: key);
  final BundleModel bundle;
  Lessons? lesson;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesController>(
      builder: (cont) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16),
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
                  onTap: () => Get.to(() => BundleCoursesView(bundle: bundle,isLocked:cont.isPaidBundle(bundle) ,)),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            child: ExtendedImage.network(
                              bundle.image?.location ??
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
                                margin: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8),
                                child: Text(
                                  bundle.name ??
                                      "",
                                  style:
                                      const TextStyle(fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Container(
                              //   margin: const EdgeInsets.only(top: 8, left: 8),
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       const Icon(IconlyLight.bag, size: 12),
                              //       Expanded(
                              //         child: Container(
                              //           margin:
                              //               const EdgeInsets.only(left: 8, top: 2),
                              //           child: Text(
                              //             course.instructor?.username ?? "",
                              //             style: const TextStyle(
                              //                 fontWeight: FontWeight.w300,
                              //                 fontSize: 8.0),
                              //             maxLines: 1,
                              //             overflow: TextOverflow.ellipsis,
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   margin: const EdgeInsets.only(top: 5, left: 8),
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       const Icon(CupertinoIcons.book, size: 12),
                              //       Expanded(
                              //         child: Container(
                              //           margin:
                              //               const EdgeInsets.only(left: 8, top: 2),
                              //           child: const Text(
                              //             '20 Videos',
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.w300,
                              //                 fontSize: 8.0),
                              //             maxLines: 1,
                              //             overflow: TextOverflow.ellipsis,
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // )
                              const SizedBox(
                                height: 15,
                              ),
                              GetBuilder<CoursesController>(builder: (cont) {
                                if (cont.isPaidBundle(bundle)) {
                                  return const SizedBox();
                                } else {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      price(bundle),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: kPrimaryColor),
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                        GetBuilder<CoursesController>(builder: (cont) {
                          if (cont.isPaidBundle(bundle)) {
                            return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor.withOpacity(0.65),
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    LocaleKeys.watch.tr,
                                    style: TextStyle(
                                        color: Theme.of(context).cardColor),
                                  ),
                                ));
                          } else {
                            return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Enroll now",
                                    style: TextStyle(
                                        color: Theme.of(context).cardColor),
                                  ),
                                ));
                          }
                        }),
                        // GetBuilder<CoursesController>(builder: (cont) {
                        //   if (/*cont.isPaidCourse(course)*/ false) {
                        //     return Container(
                        //       margin: const EdgeInsets.only(left: 8, bottom: 8),
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             child: Container(
                        //               alignment: Alignment.center,
                        //               height: 25,
                        //               padding: const EdgeInsets.only(
                        //                   left: 12.0,
                        //                   right: 12.0,
                        //                   top: 2.0,
                        //                   bottom: 2.0),
                        //               decoration: BoxDecoration(
                        //                   color: kSecondaryLightColor,
                        //                   borderRadius:
                        //                       BorderRadius.circular(35.0)),
                        //               child: const Text(
                        //                 'Continue Watching',
                        //                 style: TextStyle(
                        //                     fontSize: 8.0, color: kPrimaryColor),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   } else {
                        //     if (course.paid == false) {
                        //       return Container(
                        //         margin: const EdgeInsets.only(left: 8, bottom: 8),
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               child: RichText(
                        //                 maxLines: 1,
                        //                 overflow: TextOverflow.ellipsis,
                        //                 text: TextSpan(
                        //                   text: 'Free',
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       color: Get.theme.hoverColor,
                        //                       fontWeight: FontWeight.w500),
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     } else {
                        //       return Container(
                        //         margin: const EdgeInsets.only(left: 8, bottom: 8),
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               child: RichText(
                        //                 maxLines: 1,
                        //                 overflow: TextOverflow.ellipsis,
                        //                 text: TextSpan(
                        //                   text: "Starts",
                        //                   style: TextStyle(
                        //                       fontSize: 10,
                        //                       color: Get.theme.hoverColor,
                        //                       fontWeight: FontWeight.w300),
                        //                   children: [
                        //                     TextSpan(
                        //                       text: price(course),
                        //                       style: TextStyle(
                        //                           fontSize: 18,
                        //                           color: Get.theme.hoverColor,
                        //                           fontWeight: FontWeight.w500),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               padding: const EdgeInsets.all(5),
                        //               margin: const EdgeInsets.only(right: 8),
                        //               decoration: BoxDecoration(
                        //                   color: kSecondaryLightColor,
                        //                   borderRadius: BorderRadius.circular(12)),
                        //               child: const Text(
                        //                 "Best Seller",
                        //                 style: TextStyle(
                        //                     fontSize: 6, color: kPrimaryColor),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     }
                        //   }
                        // }),
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
                          cont.saveFavoriteCourse(bundle);
                          return true;
                        } else {
                           cont.removeFavoriteCourse(bundle);
                          return false;
                        }
                      },
                      isLiked: cont.checkCourseInFavorite(bundle),
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
    );
  }
}

String price(BundleModel bundle) {
  if (bundle.price != null) {
    return parseMoney(bundle.price.toString());
  } else {
    return "free";
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
