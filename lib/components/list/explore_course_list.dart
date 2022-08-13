import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../cards/explore_course_dart.dart';

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
          child: ExploreCourseCard(
            course: exploreCourses[index],
          ),
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: screenWidth > 800,
        itemCount: exploreCourses.length,
      ),
    );
  }
}
