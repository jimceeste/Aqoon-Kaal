import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroController extends GetxController {
  final box = GetStorage();

  List<PageViewModel> pages = [
    PageViewModel(
      title: "Welcome to Aqoon Kaab",
      body:
          "Aqoonkaab education platform waa xarun wax barasho fogaan darsi ah oo loo aas-aasay, si loo kaafiyo baahiyaha ardayda soomaaliyeed, waxbarashadana loo baahiyo heerkasta. Aqoonkaan education platform waxaa lafuray 7-8-2022. Waxaana laga furey deg.Hodanwadaag, xaafada Balagsii.",
      image: LottieBuilder.asset(
        'assets/images/i1.json',
        fit: BoxFit.cover,
      ),
    ),
    PageViewModel(
      title: "Aqoonkaab Academy",
      body:
          "Baahinta waxbarashada si ay ugaarto goobaha aan dugsiyada lahayn iyo ree miyiga.",
      image: LottieBuilder.asset(
        'assets/images/i2.json',
      ),
    ),
    PageViewModel(
      title: "Our Mission",
      body:
          "Hadafkeenu waa wax barasho tayo leh siday uheli lahaayen ardayda ku dhaqan soomaaliya iyo dhamaan bahda afkasoomaaliga kuhadasha.",
      image: LottieBuilder.asset(
        'assets/images/i3.json',
        fit: BoxFit.cover,
      ),
    ),
  ];

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
