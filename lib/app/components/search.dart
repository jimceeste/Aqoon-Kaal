import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
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
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(50)),
      child: GestureDetector(
        onTap: onTap,
        child: const TextField(
          enabled: false,
          decoration: InputDecoration(
              //contentPadding: EdgeInsets.zero,
              hintText: "Search Courses",
              prefixIcon: Icon(IconlyLight.search),
              hintStyle: TextStyle(fontSize: 13),
              border: InputBorder.none),
        ),
      ),
    );
  }
}