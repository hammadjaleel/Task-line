import 'package:flutter/material.dart';
import 'package:taskline/theme/app_themes.dart';

class WorkspaceChoiceScreen extends StatefulWidget {
  const WorkspaceChoiceScreen({super.key});

  @override
  State<WorkspaceChoiceScreen> createState() => _WorkspaceChoiceScreenState();
}

class _WorkspaceChoiceScreenState extends State<WorkspaceChoiceScreen> {
  bool createSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // ───────── TOP BAR ─────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'Step 2 of 4',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // ───────── CONTENT ─────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    // Header
                    const Text(
                      'Where will you work?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Workspaces are shared environments where your team manages projects, tasks, and deadlines together.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Selection Cards
                    _workspaceCard(
                      selected: createSelected,
                      title: 'Create a new workspace',
                      description:
                          'Set up a fresh space for your team from scratch.',
                      icon: Icons.add_box,
                      onTap: () => setState(() => createSelected = true),
                    ),

                    const SizedBox(height: 16),

                    _workspaceCard(
                      selected: !createSelected,
                      title: 'Join via invite link',
                      description:
                          'Enter an existing space using a link from your teammate.',
                      icon: Icons.link,
                      onTap: () => setState(() => createSelected = false),
                    ),

                    const SizedBox(height: 40),

                    // Decorative image placeholder
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            theme.scaffoldBackgroundColor,
                            Colors.transparent,
                          ],
                        ),
                        color: AppThemes.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ───────── BOTTOM CTA ─────────
            Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppThemes.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Navigate based on selection
                        // createSelected ? workspaceSetup : joinWorkspace
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'You can change your workspace settings later.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ───────── CARD COMPONENT ─────────

  Widget _workspaceCard({
    required bool selected,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? AppThemes.primary
                : Colors.grey.withOpacity(0.25),
            width: 2,
          ),
          color: selected
              ? AppThemes.primary.withOpacity(0.1)
              : AppThemes.surface,
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppThemes.primary.withOpacity(0.2),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: selected
                  ? Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppThemes.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(height: 24),
            ),
            const SizedBox(height: 8),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? AppThemes.primary.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.15),
              ),
              child: Icon(
                icon,
                size: 36,
                color:
                    selected ? AppThemes.primary : Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
