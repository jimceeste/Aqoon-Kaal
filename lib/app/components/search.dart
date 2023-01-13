import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../generated/locales.g.dart';
class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color:Get.isDarkMode?Theme.of(context).cardColor: Colors.grey.shade200, borderRadius: BorderRadius.circular(50)),
      child: GestureDetector(
        onTap: onTap,
        child:  TextField(
          enabled: false,
          decoration: InputDecoration(
              //contentPadding: EdgeInsets.zero,
              hintText:  LocaleKeys.search_courses.tr,
              prefixIcon: Icon(IconlyLight.search),
              hintStyle: TextStyle(fontSize: 13),
              border: InputBorder.none),
        ),
      ),
    );
  }
}