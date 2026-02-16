import 'package:flutter/material.dart';

class AppThemes {
  static const Color background = Color(0xFF0F1115);
  static const Color surface = Color(0xFF181B22);
  static const Color primary = Color(0xFF4F7DF3);
  static const Color accent = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color text = Color(0xFFE5E7EB);

  // Light theme palette (separate from dark theme)
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF1F5F9);
  static const Color lightPrimary = Color(0xFF2563EB);
  static const Color lightAccent = Color(0xFF16A34A);
  static const Color lightWarning = Color(0xFFF59E0B);
  static const Color lightText = Color(0xFF111827);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    primaryColor: lightPrimary,
    colorScheme: ColorScheme.light(
      surface: lightSurface,
      primary: lightPrimary,
      secondary: lightAccent,
      error: lightWarning,
      onSurface: lightText,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: lightText),
      bodyMedium: TextStyle(color: lightText),
      bodySmall: TextStyle(color: lightText),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightSurface,
      foregroundColor: lightText,
    ),
    cardColor: lightSurface,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightAccent,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: ColorScheme.dark(
      surface: surface,
      primary: primary,
      secondary: accent,
      error: warning,
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
