import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
    void callPhone(String phone) async {
  
    if (await canLaunchUrl(Uri.parse(phone))) {
      await launchUrl(Uri.parse(phone));
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('We couldn\'t call this phone. 0615868999'),
        ),
      );
    }
  }

  void launchWebsite(String url) async {
    try {
      

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Sorry, we cannot launch this website')),
        );
      }
    } catch (e) {
      print('on what\'s app ERROR:$e');
    }
  }

  void launchWhatsApp(String number) async {
    try {
      String phoneNumber = '252615868999';
      String message = 'Assalamu alaykum!';
      var whatsappUrl = "whatsapp://send?phone=$number&text=$message";
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl));
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
              content: Text('Whatsapp is not installed in this phone!')),
        );
      }
    } catch (e) {
      print('on what\'s app ERROR:$e');
    }
  }



  @override
  void onClose() {}
}
