import 'package:flutter/material.dart';
import 'package:taskline/theme/app_themes.dart';

enum TeamType { startup, agency, freelancer, other }

class WorkspaceSetupScreen extends StatefulWidget {
  const WorkspaceSetupScreen({super.key});

  @override
  State<WorkspaceSetupScreen> createState() => _WorkspaceSetupScreenState();
}

class _WorkspaceSetupScreenState extends State<WorkspaceSetupScreen> {
  TeamType selectedType = TeamType.startup;

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
                  Row(
                    children: [
                      _progressBar(active: false, width: 24),
                      _progressBar(active: false, width: 24),
                      _progressBar(active: true, width: 40),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // ───────── CONTENT ─────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Text(
                      'Set up your workspace',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Give your team a home. You can always change these settings later.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Workspace name
                    _label('Workspace name'),
                    _inputField(hint: 'e.g. Acme Corp'),

                    const SizedBox(height: 32),

                    // Team type
                    _label('Team type'),
                    const SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.8,
                      children: [
                        _teamTypeTile(
                          type: TeamType.startup,
                          icon: Icons.rocket_launch,
                          label: 'Startup',
                        ),
                        _teamTypeTile(
                          type: TeamType.agency,
                          icon: Icons.corporate_fare,
                          label: 'Agency',
                        ),
                        _teamTypeTile(
                          type: TeamType.freelancer,
                          icon: Icons.person_pin,
                          label: 'Freelancer',
                        ),
                        _teamTypeTile(
                          type: TeamType.other,
                          icon: Icons.more_horiz,
                          label: 'Other',
                        ),
                      ],
                    ),

                    const SizedBox(height: 48),

                    // Decorative element
                    Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppThemes.surface,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: const Icon(
                          Icons.workspaces,
                          size: 40,
                          color: Colors.white54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),

            // ───────── BOTTOM ACTIONS ─────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
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
                        elevation: 10,
                        shadowColor:
                            AppThemes.primary.withOpacity(0.3),
                      ),
                      onPressed: () {
                        // TODO: Create workspace & continue
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Create workspace',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      // TODO: Skip workspace setup
                    },
                    child: const Text(
                      "I'll do this later",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
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

  // ───────── COMPONENTS ─────────

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _inputField({required String hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppThemes.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
    );
  }

  Widget _teamTypeTile({
    required TeamType type,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = selectedType == type;

    return GestureDetector(
      onTap: () => setState(() => selectedType = type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppThemes.primary
                : Colors.white.withOpacity(0.1),
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? AppThemes.primary.withOpacity(0.1)
              : AppThemes.surface,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color:
                  isSelected ? AppThemes.primary : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color:
                    isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressBar({required bool active, required double width}) {
    return Container(
      width: width,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: active
            ? AppThemes.primary
            : AppThemes.primary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

