import 'package:aqoon_bile/app/constants.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config.dart';
import 'app/routes/app_pages.dart';
import 'app/theme.dart';

void main()async {
  await GetStorage.init();
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
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        themeMode: ThemeMode.light,
        theme: Apptheme.light,
        darkTheme: Apptheme.dark,
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
