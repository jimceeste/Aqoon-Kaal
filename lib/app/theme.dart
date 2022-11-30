import 'package:aqoon_bile/app/constants.dart';
import 'package:flutter/material.dart';



class Apptheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: "BaiJamjuree",
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.grey[120],
    hoverColor: Colors.black,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: kSecondaryLightColor),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
        bodyText1: TextStyle(fontFamily: "BaiJamjuree"),
        bodyText2: TextStyle(fontFamily: "BaiJamjuree"),
        caption: TextStyle(color: Colors.white)),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xff181D2D),
    cardColor: const Color(0xff1D2335),
    inputDecorationTheme: const InputDecorationTheme(
      hoverColor: Colors.white,
      focusColor: Colors.white,
      fillColor: Colors.white,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    hoverColor: Colors.white,
    unselectedWidgetColor: const Color(0xff1D2335),
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: Color(0xff1D2335),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xff1D2335),
    ),
    dialogBackgroundColor: const Color(0xff1D2335),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: kSecondaryDarkColor),
  );
}
