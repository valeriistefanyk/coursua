import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Color(0xFFEFF5FF);
  static const sidebarBackgroundColor = Color(0xFFF1F4F8);
  static const popupBackgroundColor = Color(0xFFF5F8FF);
  static const primaryLabelColor = Color(0xFF242629);
  static const secondaryLabelColor = Color(0xFF797F8A);
  static const shadowColor = Color.fromRGBO(72, 76, 82, 0.08);
}

class AppShadows {
  static const lightShadown = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 16,
    color: AppColors.shadowColor,
  );
}

class AppTextStyles {
  static const largeTitleStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryLabelColor,
  );

  static const titleStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryLabelColor,
  );

  static const cardTitleStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const title2Style = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryLabelColor,
  );

  static const headLineLabelStyle = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryLabelColor,
  );

  static const subtitleStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.secondaryLabelColor,
  );

  static const bodyLabelStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  static const calloutLabelStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryLabelColor,
  );

  static const secondaryCalloutLabelStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.secondaryLabelColor,
  );

  static const searchPlaceholderStyle = TextStyle(
    fontSize: 13.0,
    color: AppColors.secondaryLabelColor,
  );

  static const searchTextStyle = TextStyle(
    fontSize: 13.0,
    color: AppColors.primaryLabelColor,
  );

  static const cardSubtitleStyle = TextStyle(
    fontSize: 13.0,
    color: Color(0xE6FFFFFF),
  );

  static const captionLabelStyle = TextStyle(
    fontSize: 12.0,
    color: AppColors.secondaryLabelColor,
  );
}
