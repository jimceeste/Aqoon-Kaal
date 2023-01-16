import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BundleShimmer extends StatelessWidget {
  const BundleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: Get.height * 0.3 + 10
      ),
      itemBuilder: (context, index) => const Shim(),
    );
  }
}

class Shim extends StatelessWidget {
  const Shim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.6,
      height: Get.height * 0.3 + 10,
      decoration: const BoxDecoration(color: Colors.cyan),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.red),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 40,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: const BoxDecoration(color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
