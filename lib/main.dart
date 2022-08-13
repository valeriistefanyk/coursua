import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'screens/home.dart';
import 'styles.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coursua',
      theme: _theme(),
      home: const HomeScreen(),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      iconTheme: const IconThemeData(
        color: AppColors.primaryLabelColor,
        size: 26,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
    );
  }
}
