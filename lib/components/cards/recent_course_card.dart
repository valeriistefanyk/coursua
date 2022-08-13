import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../styles.dart';

class RecentCourseCard extends StatelessWidget {
  final Course course;
  const RecentCourseCard({required this.course, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              gradient: course.background,
              borderRadius: BorderRadius.circular(41),
              boxShadow: [
                BoxShadow(
                  color: course.background.colors[0].withOpacity(0.3),
                  offset: const Offset(0, 20),
                  blurRadius: 30,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, left: 32.0, right: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${course.numberOfSections} секцій',
                        style: AppTextStyles.cardSubtitleStyle,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        course.courseTitle,
                        style: AppTextStyles.cardTitleStyle,
                      )
                    ]),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    course.illustration,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 42.0),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 16.0)
              ]),
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(course.logo),
        ),
      ],
    );
  }
}
