import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kEndPoint = 'https://aqoonkaab-server-production.up.railway.app/api';
//const kEndPoint = 'http://192.168.10.129:9000/api/';
const kIntroScreen = 'introScreen';
const kUserInfo = 'userInfo';
const kPrimaryColor = Color(0xff1F93B1);
const kSecondaryLightColor = Color(0xffBFD331);
const String kLogo = 'assets/images/app_icon.jpg';
const String kLanguage = 'language';
const String kIsDarkMode = 'false';
const String kfavoriteLectures = 'doctors';
const String kLoading = 'assets/images/loading.json';
const String currentToken = 'currentToken';
const String kFavoriteCourses = 'course';
const String kCourses = 'courses';
// ignore: constant_identifier_names
const String KIsIntro = 'intro';

// ------------------------- LIGHT THEME CONSTANTS -------------------------
const Color kPrimaryLightColor = Color(0xFF4485FD);

// ------------------------- DARK THEME CONSTANTS -------------------------

const Color kPrimaryDarkColor = Color(0xFF03071e);
const Color kSecondaryDarkColor = Color(0xFF023047);
void erroMessage(String? message) {
  // Get.snackbar(
  //    "uh oh!",
  //   message ?? "",
  //   margin: EdgeInsets.zero,
  //   borderRadius: 0,
  //   backgroundColor: Colors.pink,
  //   colorText: Colors.white
  // );
  Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}
