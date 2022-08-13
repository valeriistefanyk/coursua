import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../cards/recent_course_card.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({Key? key}) : super(key: key);

  @override
  State<RecentCourseList> createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicators = [];
  late int currentPage;

  @override
  void initState() {
    currentPage = 0;
    super.initState();
  }

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map(
        (course) {
          var index = recentCourses.indexOf(course);
          return Container(
            width: 7,
            height: 7,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index
                  ? const Color(0xFF0971FE)
                  : const Color(0xFFA6AFFD),
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const cardHeight = 320.0;

    return Column(
      children: [
        screenWidth < 430
            ? Wrap(
                children: [
                  SizedBox(
                    height: cardHeight,
                    width: double.infinity,
                    child: PageView.builder(
                      padEnds: false,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RecentCourseCard(course: recentCourses[index]),
                      ),
                      itemCount: recentCourses.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      controller: PageController(
                        initialPage: 0,
                        viewportFraction: 0.75,
                      ),
                    ),
                  ),
                  updateIndicators(),
                ],
              )
            : SizedBox(
                height: cardHeight,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RecentCourseCard(course: recentCourses[index]),
                  ),
                  itemCount: recentCourses.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: screenWidth > 800,
                ),
              ),
      ],
    );
  }
}
