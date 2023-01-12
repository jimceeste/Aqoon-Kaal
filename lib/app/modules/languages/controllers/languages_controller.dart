import 'package:aqoon_bile/app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Languages { somali, english, arabic }

class LanguagesController extends GetxController {
  final selectedLanguage = Languages.somali.obs;

  void changeLanguage(Languages language) async {
    selectedLanguage.value = language;
    switch (language) {
      case Languages.somali:
        Get.changeLanguage(const Locale('so', 'SO'));

        break;
      case Languages.english:
        Get.changeLanguage(const Locale('en', 'US'));
        //Get.updateLocale(Locale('en', 'US'));
        break;
      default:
        Get.changeLanguage(const Locale('ar', 'AR'));
    }
  }

  @override
  void onInit() {
    super.onInit();
    switch (Get.locale?.languageCode) {
      case 'so':
        selectedLanguage.value = Languages.somali;
        break;
      case 'en':
        selectedLanguage.value = Languages.english;
        break;
      default:
        selectedLanguage.value = Languages.arabic;
    }
  }
}
