import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskline/theme/theme_provider.dart';
import 'package:taskline/screens/bottombar.dart';
import 'package:taskline/screens/onboarding/taskline_principles_screen.dart';
import 'theme/app_themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskline',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      home: BottomNavBar(),
    );
  }
}
