import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    this.onTap,
    this.isSelected = false,
    required this.name,
  }) : super(key: key);
  final Function()? onTap;
  final bool isSelected;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15),
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: BorderRadius.circular(12.0),
              border: isSelected == true
                  ? Border.all(color: Get.theme.primaryColor, width: 2)
                  : Border.all(
                      width: 0,
                      color: Colors.transparent,
                    ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 0),
                  blurRadius: 12.0,
                  color: Colors.grey.shade200,
                ),
                BoxShadow(
                  offset: const Offset(1, 0),
                  blurRadius: 12.0,
                  color: Colors.grey.shade100,
                ),
              ],
            ),
            child: Center(child: Text(name)),
          ),
          isSelected == true
              ? Positioned(
                  top: 25,
                  right: 8,
                  child: Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: Get.theme.primaryColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
