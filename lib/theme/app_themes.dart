import 'package:flutter/material.dart';

class AppThemes {
  static const Color background = Color(0xFF0F1115);
  static const Color surface = Color(0xFF181B22);
  static const Color primary = Color(0xFF4F7DF3);
  static const Color accent = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color text = Color(0xFFE5E7EB);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: ColorScheme.light(
      background: background,
      surface: surface,
      primary: primary,
      secondary: accent,
      error: warning,
      onBackground: text,
      onSurface: text,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: text),
      bodyMedium: TextStyle(color: text),
      bodySmall: TextStyle(color: text),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: surface,
      foregroundColor: text,
    ),
    cardColor: surface,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accent,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: ColorScheme.dark(
      background: background,
      surface: surface,
      primary: primary,
      secondary: accent,
      error: warning,
      onBackground: text,
      onSurface: text,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: text),
      bodyMedium: TextStyle(color: text),
      bodySmall: TextStyle(color: text),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: surface,
      foregroundColor: text,
    ),
    cardColor: surface,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accent,
      foregroundColor: Colors.white,
    ),
  );
}
