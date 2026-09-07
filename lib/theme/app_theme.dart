import 'package:flutter/material.dart';

/// Central place for the app's red-and-white brand colors.
/// Change these two values to match your church logo exactly, and every
/// screen updates automatically — nothing else in the app hardcodes color.
class AppColors {
  static const Color brandRed = const Color.fromARGB(255, 22, 2, 136);
  static const Color brandRedDark = Color.fromARGB(255, 22, 2, 136); // used for dark mode accents
  static const Color white = Color(0xFFFFFFFF);
}

/// Fixed sizing for every icon button in the app (play/bookmark/share),
/// so they're always visually consistent no matter what screen they're on.
class AppButtonStyle {
  static const double height = 56;
  static const double iconSize = 26;
  static const double borderRadius = 12;
}

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 22, 2, 136),
      brightness: Brightness.light,
      primary: AppColors.brandRed,
      surface: AppColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 22, 2, 136),
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 22, 2, 136),
        foregroundColor: AppColors.white,
        minimumSize: const Size.fromHeight(AppButtonStyle.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppButtonStyle.borderRadius),
        ),
      ),
    ),
    // Large, readable default text — matters for older users.
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, height: 1.5),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 22, 2, 136),
      brightness: Brightness.dark,
      primary: const Color.fromARGB(255, 22, 2, 136),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 22, 2, 136),
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 22, 2, 136),
        foregroundColor: AppColors.white,
        minimumSize: const Size.fromHeight(AppButtonStyle.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppButtonStyle.borderRadius),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, height: 1.5),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}
