import 'package:aqoon_bile/app/modules/courses/controllers/courses_controller.dart';
import 'package:aqoon_bile/app/modules/user/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../components/bundle_card.dart';
import '../../../components/search.dart';
import '../../../components/seprator.dart';
import '../../../components/user_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const UserInfoCard(),
                SearchCard(onTap: () => Get.to(() => const UserView())),
                Seprator(
                    title: LocaleKeys.popular_courses.tr, onPressed: () {}),
                GetBuilder<CoursesController>(
                  builder: (cont) {
                    if (cont.isBundleLoading) {
                      return const Center(child: CircularProgressIndicator(),);
                    } else if (cont.bundles.isEmpty) {
                      return const Center(child: Text("No Bundles at all"));
                    } else {
                      return CustomScrollView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: Get.height * 0.3 + 10,
                              mainAxisExtent: Get.width * 0.6,

                              mainAxisSpacing: 10.0,
                              // crossAxisSpacing: 10.0,
                              // childAspectRatio: 4.0,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              childCount: cont.bundles.length,
                              (context, index) => BundleCard(
                                bundle: cont.bundles[index],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
                // Seprator(title: "Popular Courses", onPressed: () {}),
                // CustomScrollView(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   slivers: [
                //     SliverList(
                //       delegate: SliverChildBuilderDelegate(
                //         childCount: 3,
                //         (context, index) =>
                //             CourseCardTile(course: CourseModel()),
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
