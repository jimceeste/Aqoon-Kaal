import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:aqoon_bile/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money_formatter/money_formatter.dart';

import '../../../components/play_video_card.dart';
import '../../../components/player.dart';
import '../../../constants.dart';
import '../../../data/models/course_model.dart';

import '../controllers/courses_controller.dart';

class CourseDetailView extends GetView<CoursesController> {
  final CourseModel course;
  final Lessons? lesson;

  const CourseDetailView(this.lesson, {required this.course});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale == const Locale('sa', 'AR')
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.theme.cardColor,
          iconTheme: IconThemeData(color: Get.theme.hoverColor),
          elevation: 0,
          title: Text(
            lesson != null ? lesson!.title! : LocaleKeys.course_detail.tr,
            style: TextStyle(
                color: Get.theme.hoverColor, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //VideoPlayer(id: videoId(lesson, course),),
              FramPlayer(
                id: videoId(lesson, course),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        course.name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: kPrimaryColor,
                      backgroundImage: AssetImage(kLogo),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: Text(
                          course.instructor?.username ?? "Aqoon Kaal",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const Icon(IconlyLight.video, size: 14),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 3,
                              ),
                              child: Text(
                                '${lessonsLength(course)} Videos',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
                child: Text(
                  course.shortDescription ?? "",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 8.0,
                  top: 12,
                ),
                child: Text(
                  LocaleKeys.topics.tr,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              topics(course),
              Container(
                margin: const EdgeInsets.only(
                  left: 8.0,
                  top: 12,
                ),
                child: Text(
                  LocaleKeys.lessons.tr,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              sections(course),
            ],
          ),
        ),
        floatingActionButton: course.isAppleReview != true
            ? course.paid != true
                ? GetBuilder<CoursesController>(builder: (cont) {
                    return GetBuilder<UserController>(builder: (login) {
                      return FloatingActionButton.extended(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        onPressed: () {
                          // if (login.hasData) {
                          //   numberPopUp(
                          //       onPressed: () {
                          //         cont.registerFreeCourse(course);
                          //       },
                          //       isLoading: cont.isBuyingCourse);
                          // } else {
                          //   Get.toNamed(Routes.LOGIN);
                          // }
                        },
                        label: const Text('Enroll'),
                      );
                    });
                  })
                : const SizedBox()
            : const SizedBox(),
        bottomNavigationBar: course.isAppleReview != true
            ? course.paid == false
                ? const SizedBox()
                : GetBuilder<UserController>(builder: (login) {
                    return GetBuilder<CoursesController>(builder: (cont) {
                      if (cont.isPaidCourse(course)) {
                        return const SizedBox();
                      } else {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                            onPressed: () {
                              // if (login.hasData) {
                              //   cont.getPlanes(slug: course.slug ?? "");
                              //   Get.bottomSheet(backgroundColor: Colors.white,
                              //       GetBuilder<CoursesController>(
                              //     builder: (c) {
                              //       if (cont.isPlanesLoading) {
                              //         return Center(
                              //           child: SizedBox(
                              //             width: 200,
                              //             height: 200,
                              //             child: Lottie.asset(
                              //                 'assets/images/loading.json'),
                              //           ),
                              //         );
                              //       } else {
                              //         return ModalProgressHUD(
                              //           inAsyncCall: c.isBuyingCourse,
                              //           progressIndicator: SizedBox(
                              //             width: 150,
                              //             height: 150,
                              //             child: Lottie.asset(
                              //                 'assets/images/loading.json'),
                              //           ),
                              //           child: SingleChildScrollView(
                              //             child: Column(
                              //               children: [
                              //                 Container(
                              //                     margin: const EdgeInsets.all(5.0),
                              //                     alignment: Alignment.topRight,
                              //                     child: InkWell(
                              //                       onTap: () {
                              //                         Navigator.pop(context);
                              //                       },
                              //                       child: const Icon(
                              //                           CupertinoIcons.multiply),
                              //                     )),
                              //                 Text(
                              //                   'Payment Plans',
                              //                   style: GoogleFonts.pacifico(
                              //                     fontSize: 30.0,
                              //                     fontWeight: FontWeight.w500,
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin:
                              //                       const EdgeInsets.only(top: 15.0),
                              //                   child: const Text(
                              //                     'To take this courses get our Plans',
                              //                     style: TextStyle(
                              //                         fontSize: 16.0,
                              //                         fontWeight: FontWeight.w500),
                              //                   ),
                              //                 ),
                              //                 c.planes.isNotEmpty
                              //                     ? Column(
                              //                         children: [
                              //                           Container(
                              //                             margin:
                              //                                 const EdgeInsets.all(
                              //                                     12),
                              //                             height: 100,
                              //                             child: ListView.builder(
                              //                               shrinkWrap: true,
                              //                               itemCount:
                              //                                   c.planes.length,
                              //                               scrollDirection:
                              //                                   Axis.horizontal,
                              //                               itemBuilder:
                              //                                   (context, index) {
                              //                                 bool isseclected =
                              //                                     c.selectedPlan ==
                              //                                         index;
                              //                                 return Align(
                              //                                   alignment:
                              //                                       Alignment.center,
                              //                                   child: PlanCard(
                              //                                     isSelected:
                              //                                         isseclected,
                              //                                     onTap: () {
                              //                                       c.updatedSelectedPlanIndex(
                              //                                           index);
                              //                                     },
                              //                                     plan:
                              //                                         c.planes[index],
                              //                                   ),
                              //                                 );
                              //                               },
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             width: 150,
                              //                             child: ElevatedButton(
                              //                               style: ElevatedButton
                              //                                   .styleFrom(
                              //                                       elevation: 0,
                              //                                       primary:
                              //                                           kPrimaryColor),
                              //                               onPressed: () {
                              //                                 numberPopUp(
                              //                                     onPressed: () {
                              //                                       c.buyCourse(
                              //                                           course:
                              //                                               course,
                              //                                           plan: c.planes[
                              //                                               c.selectedPlan]);
                              //                                     },
                              //                                     isEnabledCashOnDelivery:
                              //                                         true);
                              //                               },
                              //                               child: Text(
                              //                                   'Buy ${parseMoney(c.planes[c.selectedPlan].price ?? "")}'),
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       )
                              //                     : Column(
                              //                         children: [
                              //                           SizedBox(
                              //                             width: 200,
                              //                             height: 200,
                              //                             child: Lottie.asset(
                              //                                 'assets/images/no_data.json'),
                              //                           ),
                              //                           const Text('No Planes Found'),
                              //                         ],
                              //                       )
                              //               ],
                              //             ),
                              //           ),
                              //         );
                              //       }
                              //     },
                              //   ));
                              // } else {
                              //   Get.toNamed(Routes.LOGIN);
                              // }
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Buy Now ',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                                children: [
                                  TextSpan(
                                      text: price(course),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
                  })
            : const SizedBox(),
      ),
    );
  }
}

numberPopUp({
  Function()? onPressed,
  bool isLoading = false,
  bool isEnabledCashOnDelivery = false,
}) {
  return Get.dialog(
    GetBuilder<CoursesController>(builder: (cont) {
      return ModalProgressHUD(
        inAsyncCall: cont.isBuyingCourse,
        child: AlertDialog(
          title: const Text(
            'Enter your number',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          content: GetBuilder<CoursesController>(builder: (c) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: c.formKey,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        //color: Get.theme.cardColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: InternationalPhoneNumberInput(
                        textFieldController: c.textFieldController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Number is required'.tr;
                          }
                          return null;
                        },
                        onInputChanged: (PhoneNumber number) {
                          c.numberValue.value = number.phoneNumber.toString();
                        },
                        inputDecoration: const InputDecoration(
                            // border: InputBorder.none,
                            hintText: 'Your Number',
                            hintStyle: TextStyle(fontSize: 12.0)),
                        onInputValidated: (bool value) {},
                        selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            leadingPadding: 8.0,
                            trailingSpace: false,
                            setSelectorButtonAsPrefixIcon: true),
                        ignoreBlank: true,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle:
                            TextStyle(color: Get.theme.hoverColor),
                        initialValue: c.number,
                        formatInput: true,
                        maxLength: 10,
                        scrollPadding: const EdgeInsets.all(8.0),
                        spaceBetweenSelectorAndTextField: 0,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {},
                      ),
                    ),
                  ),
                  // GetBuilder<CoursesController>(builder: (cont) {
                  //   return isEnabledCashOnDelivery
                  //       ? OptionCard(
                  //           name: 'Cash On Delivery',
                  //           onTap: () {
                  //             if (cont.isSelectedCashOnDelivery == 1) {
                  //               cont.updateIselectedCashOndelivery(11);
                  //             } else {
                  //               cont.updateIselectedCashOndelivery(1);
                  //             }
                  //           },
                  //           isSelected: cont.isSelectedCashOnDelivery == 1,
                  //         )
                  //       : const SizedBox();
                  // }),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor, elevation: 0),
                      onPressed: onPressed,
                      child: const Text('Submit'),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      );
    }),
  );
}

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    this.onTap,
    this.isSelected = false,
    required this.name,
  }) : super(key: key);
  final Function()? onTap;
  final bool isSelected;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15),
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: BorderRadius.circular(12.0),
              border: isSelected == true
                  ? Border.all(color: Get.theme.primaryColor, width: 2)
                  : Border.all(
                      width: 0,
                      color: Colors.transparent,
                    ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 0),
                  blurRadius: 12.0,
                  color: Colors.grey.shade200,
                ),
                BoxShadow(
                  offset: const Offset(1, 0),
                  blurRadius: 12.0,
                  color: Colors.grey.shade100,
                ),
              ],
            ),
            child: Center(child: Text(name)),
          ),
          isSelected == true
              ? Positioned(
                  top: 25,
                  right: 8,
                  child: Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: Get.theme.primaryColor,
                  ),
                )
              : Container(),
        ],
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
    return "Free";
  }
}

String parseMoney(String money) {
  MoneyFormatter price = MoneyFormatter(amount: double.parse(money));
  return price.output.compactSymbolOnLeft;
}

Widget sections(CourseModel course) {
  if (course.sections!.isNotEmpty) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: course.sections!
          .map((g) => Container(
                decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.only(left: 8, top: 12, right: 8),
                child: Material(
                  color: Get.theme.cardColor,
                  child: Theme(
                    data: Get.theme.copyWith(dividerColor: Colors.transparent),
                    child: GetBuilder<CoursesController>(builder: (cont) {
                      return ExpansionTile(
                        initiallyExpanded: cont.currentSection == g.sId,
                        backgroundColor: Get.theme.cardColor,
                        textColor: kPrimaryColor,
                        iconColor: kSecondaryLightColor,
                        leading: const Icon(IconlyBold.document,
                            color: kPrimaryColor),
                        title: Text(
                          g.name ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        children: g.lessons!
                            .map(
                              (e) =>
                                  GetBuilder<UserController>(builder: (login) {
                                return PlayCard(
                                  isPaid: login.hasData
                                      ? cont.isPaidCourse(course)
                                      : false,
                                  section: g,
                                  lesson: e,
                                  course: course,
                                );
                              }),
                            )
                            .toList(),
                      );
                    }),
                  ),
                ),
              ))
          .toList(),
    );
  } else {
    return const SizedBox();
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

Widget topics(CourseModel course) {
  if (course.whatYouWillLearn!.isNotEmpty) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: course.whatYouWillLearn!
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(left: 6),
                  child: Chip(
                    label: Text(
                      e,
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w300),
                    ),
                    elevation: 0,
                    backgroundColor: Get.theme.cardColor,
                    side: BorderSide(
                      color: Get.theme.primaryColor.withOpacity(0.17),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  } else {
    return const SizedBox();
  }
}

String videoId(Lessons? lesson, CourseModel course) {
  String? link;

  if (lesson != null) {
    link = lesson.videoLink ?? "";
  } else {
    if (course.sections!.isNotEmpty) {
      for (var element in course.sections!) {
        if (element.lessons!.isNotEmpty) {
          link = course.sections!.first.lessons!.first.videoLink!;
        }
      }
    } else {
      link = '253989945';
    }
  }

  return link ?? "253989945";
}
