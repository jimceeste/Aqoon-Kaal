import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../../constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (main) {
        return WillPopScope(
          onWillPop: ()=>main.exit(main.index),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                //this color must be equal to the WaterDropNavBar backgroundColor
                statusBarColor:Get.theme.scaffoldBackgroundColor ,
                systemNavigationBarColor: Get.theme.cardColor,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            child: Scaffold(
              body: GetBuilder<HomeController>(
                  builder: (cont) => cont.screens[cont.index]),
              bottomNavigationBar: GetBuilder<HomeController>(
                builder: (cont) {
                  return WaterDropNavBar(
                    iconSize: 24,
                    bottomPadding: 8,
                    backgroundColor: Theme.of(context).cardColor,
                    selectedIndex: cont.index,
                    onItemSelected:cont.updateIndex,
                    inactiveIconColor: kPrimaryColor,
                    waterDropColor: kPrimaryColor,
                    barItems: [
                      BarItem(
                        filledIcon: IconlyBold.home,
                        outlinedIcon: IconlyLight.home,
                      ),
                      BarItem(
                        filledIcon: IconlyBold.search,
                        outlinedIcon: IconlyLight.search,
                      ),
                      BarItem(
                        filledIcon: IconlyBold.discovery,
                        outlinedIcon: IconlyLight.discovery,
                      ),
                      BarItem(
                        filledIcon: IconlyBold.profile,
                        outlinedIcon: IconlyLight.profile,
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        );
      }
    );
  }
}
