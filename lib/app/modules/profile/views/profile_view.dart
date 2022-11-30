import 'package:aqoon_bile/app/components/profile_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
                   const ProfileMenu(
                    text: "My Courses",
                    leadingIcon: Icon(
                      IconlyLight.discovery,
                      color: kPrimaryColor,
                    ),
                  ),
                  const ProfileMenu(
                    text: "Favorites",
                    leadingIcon: Icon(
                      IconlyLight.heart,
                      color: kPrimaryColor,
                    ),
                  ),
                  const ProfileMenu(
                    text: "Dark Mode",
                    leadingIcon: Icon(
                      CupertinoIcons.brightness,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.toggle_off_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  const ProfileMenu(
                    text: "Language",
                    leadingIcon: Icon(
                      Icons.translate,
                      color: kPrimaryColor,
                    ),
                  ),
                  ProfileMenu(
                    text: "Sign Out",
                    leadingIcon: const Icon(
                      IconlyLight.logout,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
