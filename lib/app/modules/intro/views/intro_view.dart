import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';


import '../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('IntroView'),
      //   centerTitle: true,
      // ),
      body: IntroductionScreen(
        pages: controller.pages,
        onDone: () async {
          Navigator.pushNamed(context, Routes.HOME);
          await controller.box.write(KIsIntro, true);
        },
        isTopSafeArea: true,
        showSkipButton: true,
        showNextButton: true,
        next: const Text(
          "Next",
          style: TextStyle(color: kPrimaryLightColor),
        ),
        skip: const Text(
          "Skip",
          style: TextStyle(color: kSecondaryLightColor),
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: kPrimaryLightColor,
          ),
        ),
        dotsDecorator: DotsDecorator(
          activeColor: kPrimaryLightColor,
          color: kSecondaryLightColor.withOpacity(0.55),
        ),
      ),
    );
  }
}
