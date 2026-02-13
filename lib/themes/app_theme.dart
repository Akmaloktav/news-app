import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';

class AppTheme {
  static const Color mainColor = Color(0xFFD32F2F);

  static final light = ThemeData(
    primaryColor: mainColor,
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    canvasColor: Color(0xFFF5F5F5),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF121010)),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: mainColor,
      primary: mainColor,
      brightness: Brightness.light,
      surface: Color(0xFFFFFFFF),
    ),
    cardColor: Color(0xFFFFFFFF),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 3,
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: AppTextstyle.getBaseTextTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
      unselectedLabelStyle: AppTextstyle.getBaseTextTheme.labelMedium,
    ),
    textTheme: AppTextstyle.getBaseTextTheme,
  );

  static final dark = ThemeData(
    primaryColor: mainColor,
    scaffoldBackgroundColor: Color(0xFF121010),
    canvasColor: Color(0xFF121010),
    brightness: Brightness.dark,
    appBarTheme: AppBarThemeData(
      backgroundColor: Color(0xFF121010),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFF5F5F5)),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: mainColor,
      primary: mainColor,
      brightness: Brightness.dark,
      surface: Color(0xFF1E1B1B),
    ),
    cardColor: Color(0xFF1E1B1B),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF121010),
      elevation: 3,
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: AppTextstyle.getBaseTextTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
      unselectedLabelStyle: AppTextstyle.getBaseTextTheme.labelMedium,
    ),
    textTheme: AppTextstyle.getBaseTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
