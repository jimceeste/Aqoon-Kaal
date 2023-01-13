import 'package:aqoon_bile/app/constants.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config.dart';
import 'app/routes/app_pages.dart';
import 'app/theme.dart';
import 'generated/locales.g.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  await box.writeIfNull(kLanguage, const Locale('so', 'SO').toLanguageTag());
  await box.writeIfNull(kIsDarkMode, false);
  await box.writeIfNull(KIsIntro, false);
  final isDarkMode = box.read(kIsDarkMode) as bool;
  final strLocale = box.read(kLanguage) as String;
  bool isIntro = box.read(KIsIntro);
  runApp(
    ConnectivityAppWrapper(
      app: GetMaterialApp(
        title: "Aqoon Bile",
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        routingCallback: Config.callBack,
        getPages: AppPages.routes,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: Apptheme.light,
        darkTheme: Apptheme.dark,
        translationsKeys: AppTranslation.translations,
        locale: Locale(strLocale.substring(0, 2), strLocale.substring(3, 5)),
        //initialRoute: isIntro == true ? AppPages.INITIAL : Routes.INTRO,
        initialRoute: AppPages.INITIAL,
        textDirection: TextDirection.ltr,
      ),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kSecondaryLightColor,
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
