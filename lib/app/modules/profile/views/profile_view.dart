import 'package:aqoon_bile/app/components/profile_menu.dart';
import 'package:aqoon_bile/app/extensions.dart';
import 'package:aqoon_bile/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:aqoon_bile/app/modules/languages/controllers/languages_controller.dart';
import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:aqoon_bile/app/routes/app_pages.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../generated/locales.g.dart';
import '../../../components/profile_menu_horizontal.dart';
import '../../../constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ProfileMenuHorizontal(
                    name: "AHMED MOHAMED",
                  ),
                  ProfileMenu(
                    text: LocaleKeys.my_courses.tr,
                    leadingIcon: Icon(
                      IconlyLight.discovery,
                      color: kPrimaryColor,
                    ),
                  ),
                  GetBuilder<FavoritesController>(builder: (cont) {
                    return ProfileMenu(
                      onPressed: () => Get.toNamed(Routes.FAVORITES),
                      text: LocaleKeys.favorites.tr,
                      leadingIcon: Icon(
                        IconlyLight.heart,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: cont.favoriteCourses.isEmpty
                          ? Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Get.theme.hoverColor,
                            )
                          : Badge(
                              badgeContent:
                                  Text(cont.favoriteCourses.length.toString()),
                            ),
                    );
                  }),
                  ProfileMenu(
                    onPressed: () => Get.switchTheme(context),
                    text: LocaleKeys.dark_mode.tr,
                    leadingIcon: Icon(
                      CupertinoIcons.brightness,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.toggle_off_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  GetBuilder<LanguagesController>(builder: (cont) {
                    return ProfileMenu(
                      onPressed: () => Get.toNamed(Routes.LANGUAGES),
                      text: LocaleKeys.languages.tr,
                      leadingIcon: Icon(
                        Icons.translate,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: GetBuilder<LanguagesController>(
                        builder: (cont) {
                          if (cont.selectedLanguage.value == Languages.arabic) {
                            return SizedBox(
                                width: 25,
                                height: 25,
                                child: SvgPicture.asset("assets/icons/sa.svg"));
                          } else if (cont.selectedLanguage.value ==
                              Languages.english) {
                            return SizedBox(
                                width: 25,
                                height: 25,
                                child: SvgPicture.asset("assets/icons/gb.svg"));
                          } else {
                            return SizedBox(
                                width: 25,
                                height: 25,
                                child: SvgPicture.asset("assets/icons/so.svg"));
                          }
                        },
                      ),
                    );
                  }),
                  GetBuilder<UserController>(builder: (cont) {
                    return Visibility(
                      visible: cont.hasData,
                      child: ProfileMenu(
                        text: LocaleKeys.sign_out.tr,
                        leadingIcon: const Icon(
                          IconlyLight.logout,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: const Text("Are you sure to log out ?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    cont.logout();
                                    Get.back();
                                  },
                                  child: const Text("Yes"),
                                ),
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text("No"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
