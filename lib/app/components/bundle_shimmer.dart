import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BundleShimmer extends StatelessWidget {
  const BundleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: Get.height * 0.3 + 10,
            mainAxisExtent: Get.width * 0.6,

            mainAxisSpacing: 10.0,
            // crossAxisSpacing: 10.0,
            // childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (context, index) => Container(
              decoration: const BoxDecoration(
                color: Colors.cyan
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.grey),
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
            ),
          ),
        )
      ],
    );
  }
}
