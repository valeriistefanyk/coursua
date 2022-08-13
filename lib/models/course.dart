import 'package:flutter/material.dart';

class Course {
  final String courseTitle;
  final String? courseSubtitle;
  final int numberOfSections;
  final LinearGradient background;
  final String illustration;
  final String logo;

  Course({
    required this.courseTitle,
    required this.numberOfSections,
    required this.background,
    required this.illustration,
    required this.logo,
    this.courseSubtitle,
  });
}

var courses = [
  Course(
    courseTitle: "Хімія",
    numberOfSections: 16,
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'assets/illustrations/lab.png',
    logo: 'assets/logos/chemistry.png',
  ),
  Course(
    courseTitle: "Всесвітня історія",
    numberOfSections: 21,
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFD504F),
        Color(0xFFFF8181),
      ],
    ),
    illustration: 'assets/illustrations/world-globe.png',
    logo: 'assets/logos/history.png',
  ),
  Course(
    courseTitle: "Математика",
    numberOfSections: 19,
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E1EE),
        Color(0xFF001392),
      ],
    ),
    illustration: 'assets/illustrations/mathematics.png',
    logo: 'assets/logos/maths.png',
  ),
  Course(
    courseTitle: "Українська мова",
    numberOfSections: 21,
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    illustration: 'assets/illustrations/chrysanthemum.png',
    logo: 'assets/logos/languages.png',
  ),
  Course(
    courseTitle: "Біологія",
    numberOfSections: 11,
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FF),
      ],
    ),
    illustration: 'assets/illustrations/lab.png',
    logo: 'assets/logos/biology.png',
  ),
];

var recentCourses = courses.take(courses.length ~/ 2).toList();

var exploreCourses = courses.skip(courses.length ~/ 2).toList();
