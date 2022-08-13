import 'package:flutter/material.dart';

import '../styles.dart';
import '../components/list/recent_course_list.dart';
import '../components/home_nav_bar.dart';
import '../components/list/explore_course_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeScreenNavBar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Нові курси",
              style: AppTextStyles.largeTitleStyle,
            ),
          ),
          const SizedBox(height: 15),
          const RecentCourseList(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Знайди своє!",
                  style: AppTextStyles.titleStyle,
                ),
                SizedBox(height: 5),
                Text(
                  "14 курсів, скоро поповнення",
                  style: AppTextStyles.subtitleStyle,
                )
              ],
            ),
          ),
          const ExploreCourseList(),
        ],
      ),
    ));
  }
}
