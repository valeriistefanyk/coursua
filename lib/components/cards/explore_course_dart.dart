import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../styles.dart';

class ExploreCourseCard extends StatelessWidget {
  final Course course;
  const ExploreCourseCard({required this.course, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41),
        child: Container(
          height: 120,
          width: 280,
          decoration: BoxDecoration(gradient: course.background),
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${course.numberOfSections} секцій',
                      style: AppTextStyles.cardSubtitleStyle,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      course.courseTitle,
                      style: AppTextStyles.cardTitleStyle,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    course.illustration,
                    fit: BoxFit.cover,
                    height: 100,
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
