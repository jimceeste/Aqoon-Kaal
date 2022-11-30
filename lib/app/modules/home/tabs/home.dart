import 'package:aqoon_bile/app/components/course_card.dart';
import 'package:aqoon_bile/app/components/course_card_tile.dart';
import 'package:aqoon_bile/app/data/models/course_model.dart';
import 'package:aqoon_bile/app/modules/user/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                 SearchCard(onTap: ()=>Get.to(()=>const UserView())),
                Seprator(title: "Popular Courses", onPressed: () {}),
                SizedBox(
                  height: Get.height * 0.3 + 10,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 3,
                          (context, index) => CourseCard(
                            course: CourseModel(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Seprator(title: "Popular Courses", onPressed: () {}),
                CustomScrollView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 3,
                        (context, index) =>
                            CourseCardTile(course: CourseModel()),
                      ),
                    )
                  ],
                ),
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
