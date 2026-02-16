import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskline/providers/auth_providers.dart';
import 'package:taskline/screens/auth/login_screen.dart';
import 'package:taskline/screens/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProviders>(context);
    final isAuthenticated = auth.user != null && (auth.user?.token ?? '').isNotEmpty;

    return isAuthenticated ? const HomeScreen() : const LoginScreen();
  }
}
