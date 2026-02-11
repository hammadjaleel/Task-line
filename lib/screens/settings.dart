import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskline/providers/auth_providers.dart';
import 'package:taskline/screens/auth/login_screen.dart';
import 'package:taskline/theme/theme_provider.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final auth = Provider.of<AuthProviders>(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Top App Bar ─────────────────────────────
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: (){},
                    ),
                    Expanded(
                      child: Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // ─── Profile Header ──────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 112,
                          width: 112,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCn4xsYMqFFY6OzC4jpVounyFjMpgECHCSbupdiQBCrwP_YHb-n6aRXwBN-D94Cus21INEnLUXc1zCXtuldppEa8-TD-wW8X5UX8mdd5OiDcjJUywaZnU_bXVoGtadeDQAxL73vBuA6O_IyzSx7As5tWGHmBvUTc_Lght-kY6sBkKbEiKmkVau3-yrceUoR10236KR1blQG7jM_4w_yaGgSa9YglBDPliDp0LairlqXEgY41l5opZOVi3GcxbItiKooRfniPsLb_ts',
                              ),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: colors.primary.withOpacity(0.2),
                              width: 4,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colors.background,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      auth.user?.name ?? 'Alex Johnson',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      auth.user?.email ?? 'alex.j@example.com',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),

              // ─── Sections ───────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account
                    Text(
                      'ACCOUNT',
                      style: theme.textTheme.labelSmall?.copyWith(
                        letterSpacing: 1.5,
                        color: colors.onSurface.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  colors.primary.withOpacity(0.1),
                              child: Icon(Icons.person,
                                  color: colors.primary),
                            ),
                            title: const Text('Profile Details'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                          Divider(
                            height: 1,
                            color: colors.onSurface.withOpacity(0.1),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  colors.primary.withOpacity(0.1),
                              child: Icon(Icons.verified_user,
                                  color: colors.primary),
                            ),
                            title: const Text('Security'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Preferences
                    Text(
                      'PREFERENCES',
                      style: theme.textTheme.labelSmall?.copyWith(
                        letterSpacing: 1.5,
                        color: colors.onSurface.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  colors.primary.withOpacity(0.1),
                              child: Icon(Icons.notifications,
                                  color: colors.primary),
                            ),
                            title: const Text('Notifications'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                          Divider(
                            height: 1,
                            color: colors.onSurface.withOpacity(0.1),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  colors.primary.withOpacity(0.1),
                              child: Icon(Icons.dark_mode,
                                  color: colors.primary),
                            ),
                            title: const Text('Dark Mode'),
                            trailing: Switch(
                              value: themeProvider.isDarkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme(value);
                              },
                              activeColor: colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Legal
                    Text(
                      'LEGAL',
                      style: theme.textTheme.labelSmall?.copyWith(
                        letterSpacing: 1.5,
                        color: colors.onSurface.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              colors.primary.withOpacity(0.1),
                          child:
                              Icon(Icons.shield, color: colors.primary),
                        ),
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Logout
                    Container(
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.red.withOpacity(0.1),
                          child: const Icon(Icons.logout,
                              color: Colors.red),
                        ),
                        title: const Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          auth.logout();
                          // Navigate to login screen or show confirmation
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:  (context)=>const LoginScreen()));
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // App Info
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Focus Productivity v2.4.0',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Made with passion',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.textTheme.labelSmall?.color?.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
