import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:aqoon_bile/app/constants.dart';
import 'package:aqoon_bile/app/data/models/bundel_model.dart';
import 'package:aqoon_bile/app/modules/courses/controllers/courses_controller.dart';
import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:aqoon_bile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../components/course_card_tile_main.dart';
import '../../../components/option_card.dart';

class BundleCoursesView extends StatefulWidget {
  const BundleCoursesView(
      {Key? key, required this.bundle, this.isLocked = false})
      : super(key: key);
  final BundleModel bundle;
  final bool isLocked;
  @override
  State<BundleCoursesView> createState() => _BundleCoursesViewState();
}

class _BundleCoursesViewState extends State<BundleCoursesView>
    with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (cont) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.bundle.name ?? "",
            style: TextStyle(color: Theme.of(context).hoverColor),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).hoverColor),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Dhamaan Casharad \naad Heleeso",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: GetBuilder<CoursesController>(
                builder: (cont) {
                  if (cont.isBundleCoursesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (cont.courses.isEmpty) {
                    return const Center(child: Text("No Courses at all"));
                  } else {
                    return CustomScrollView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: cont.courses.length,
                            (context, index) => CourseCardMain(
                              course: cont.courses[index],
                              isLocked: widget.isLocked,
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ),
            //const SizedBox(height: 50,),
          ],
        ),
        bottomNavigationBar: isLocket()
            ? const SizedBox()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => paymentPopUp(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor, elevation: 0),
                  child: const Text("Buy now"),
                ),
              ),
      );
    });
  }

  bool isLocket() {
    final box = GetStorage();
    if (box.hasData(kUserInfo)) {
      return widget.isLocked;
    } else {
      return false;
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Get.find<CoursesController>().getBundleCourses(id: widget.bundle.sId ?? "");
  }

  paymentPopUp({
    // Function()? onPressed,
    bool isLoading = false,
    bool isEnabledCashOnDelivery = false,
  }) {
    final box = GetStorage();
    if (box.hasData(kUserInfo)) {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: GetBuilder<CoursesController>(
            builder: (cont) {
              return ModalProgressHUD(
                inAsyncCall: cont.isBuyingCourse,
                child: GetBuilder<CoursesController>(builder: (c) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Enter your number to pay with EVC, ZAAD and SAHAL",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
                                  c.numberValue.value =
                                      number.phoneNumber.toString();
                                },
                                inputDecoration: const InputDecoration(
                                    // border: InputBorder.none,
                                    hintText: 'Your Number',
                                    hintStyle: TextStyle(fontSize: 12.0)),
                                onInputValidated: (bool value) {},
                                selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
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
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                inputBorder: const OutlineInputBorder(),
                                onSaved: (PhoneNumber number) {},
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GetBuilder<CoursesController>(builder: (cont) {
                            return OptionCard(
                              name: 'Cash On Delivery',
                              onTap: () {
                                if (cont.isSelectedCashOnDelivery == 1) {
                                  cont.updateIselectedCashOndelivery(11);
                                } else {
                                  cont.updateIselectedCashOndelivery(1);
                                }
                              },
                              isSelected: cont.isSelectedCashOnDelivery == 1,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor, elevation: 0),
                              onPressed: () => cont.buyCourse(
                                  bundleId: widget.bundle.sId ?? ""),
                              child: const Text('Submit'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Please make sign in \nfirst and the come back 🥰 \n\n👇",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () =>Get.toNamed(Routes.USER),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        )),
      );
    }
  }
}
