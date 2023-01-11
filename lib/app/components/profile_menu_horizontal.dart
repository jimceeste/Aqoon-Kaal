
import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../routes/app_pages.dart';


class ProfileMenuHorizontal extends StatelessWidget {
  const ProfileMenuHorizontal({
    Key? key,
    required this.name,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            userImage(),
            const SizedBox(width: 18),
            Expanded(
              child: userInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfo() {
    return GetBuilder<UserController>(
      builder: (cont) {
       
        if (cont.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              cont.user.dDoc?.phone??"",
                style: TextStyle(
                    color:
                        Get.isDarkMode ? Colors.white : Get.theme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                onTap: () {
                 
                },
                child: const Text(
                  'View Profile',
                  style: TextStyle(
                    color: kSecondaryLightColor,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aqoon Kaal',
                style: TextStyle(
                    color:
                        Get.isDarkMode ? Colors.white : Get.theme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.USER);
                },
                child: const Text(
                  ' Signin',
                  style: TextStyle(
                    color: kSecondaryLightColor,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget userImage() {
    return GetBuilder<UserController>(
      builder: (cont) {
        if (cont.hasData) {
          return Container(
            padding: const EdgeInsets.all(5),
            decoration: DottedDecoration(
                shape: Shape.circle, color: kPrimaryColor, strokeWidth: 0.5),
            child: CircleAvatar(
              backgroundImage: ExtendedNetworkImageProvider(
                "https://www.vocaleurope.eu/wp-content/uploads/no-image.jpg"),
              onBackgroundImageError: (e, t) {
                print('THE ERROR: $e');
                print('THE TRUCE: $t');
              },
              radius: 28,
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                shape: BoxShape.circle,
                boxShadow: Get.isDarkMode
                    ? []
                    : [
                        BoxShadow(
                            offset: const Offset(1, 10),
                            color: Colors.grey.shade200,
                            blurRadius: 12,
                            blurStyle: BlurStyle.normal),
                        BoxShadow(
                            offset: const Offset(1, 10),
                            color: Colors.grey.shade300,
                            blurRadius: 12,
                            blurStyle: BlurStyle.normal)
                      ]),
            child: CircleAvatar(
              radius: 28,
              backgroundImage:  ExtendedNetworkImageProvider("https://www.vocaleurope.eu/wp-content/uploads/no-image.jpg"),
              onBackgroundImageError: (e, t) {
                print('THE ERROR: $e');
                print('THE TRUCE: $t');
              },
            ),
          );
        }
      },
    );
  }
}
