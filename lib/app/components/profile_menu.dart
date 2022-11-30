import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.leadingIcon,
    this.onPressed,
    this.suffixIcon,
  }) : super(key: key);

  final String text;
  final Widget? leadingIcon, suffixIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Get.isDarkMode
              ? Colors.black12
              : kPrimaryColor.withOpacity(0.03)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            leadingIcon ?? const SizedBox(),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Get.theme.primaryColor,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
            suffixIcon ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color:  Get.theme.hoverColor ,
                ),
          ],
        ),
      ),
    );
  }
}
