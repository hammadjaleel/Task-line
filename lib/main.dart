import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskline/providers/create_project_provider.dart';
import 'package:taskline/providers/create_task_provider.dart';
import 'package:taskline/providers/dashboard_provider.dart';
import 'package:taskline/providers/listAllProjectsProvider.dart';
import 'package:taskline/providers/list_taskbyid.dart';
import 'package:taskline/screens/auth_wrapper.dart';
import 'package:taskline/theme/theme_provider.dart';
import 'package:taskline/providers/auth_providers.dart';
import 'theme/app_themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProviders()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => CreateProjectProvider()),
        ChangeNotifierProvider(create: (_)=> CreateTaskProvider()),
        ChangeNotifierProvider(create: (_)=> TaskByIdProvider()),
        ChangeNotifierProvider(create: (_)=> Listallprojectsprovider()),
      ],
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
      home: AuthWrapper(),
    );
  }
}

