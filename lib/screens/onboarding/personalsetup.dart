import 'package:flutter/material.dart';
import 'package:taskline/theme/app_themes.dart';

class PersonalSetupScreen extends StatelessWidget {
  const PersonalSetupScreen({super.key});

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
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'STEP 1 OF 3',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            // ───────── HEADER ─────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Icon(
                      Icons.visibility,
                      size: 120,
                      color: AppThemes.primary.withOpacity(0.1),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 8),
                      Text(
                        'Personal Setup',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Tell us a bit about yourself. Your details help Taskline keep your team synchronized and accountable across time zones.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ───────── CONTENT ─────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step indicator
                    Row(
                      children: [
                        _stepBar(active: true),
                        _stepDot(),
                        _stepDot(),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Full Name
                    _label('Full Name'),
                    _inputField(
                      hint: 'e.g. Alex Rivers',
                    ),

                    const SizedBox(height: 20),

                    // Timezone
                    _label('Your Timezone'),
                    _dropdownField(),

                    const SizedBox(height: 20),

                    // Role
                    _label('Your Role'),
                    _inputField(
                      hint: 'e.g. Product Manager',
                    ),
                  ],
                ),
              ),
            ),

            // ───────── BOTTOM ACTION ─────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
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
                        elevation: 8,
                        shadowColor:
                            AppThemes.primary.withOpacity(0.3),
                      ),
                      onPressed: () {
                        // TODO: Navigate to next onboarding step
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
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
          fontWeight: FontWeight.w500,
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

  Widget _dropdownField() {
    return Container(
      decoration: BoxDecoration(
        color: AppThemes.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: 'Pacific Time (PT) - Los Angeles',
          isExpanded: true,
          icon: const Icon(Icons.expand_more),
          items: const [
            DropdownMenuItem(
              value: 'Pacific Time (PT) - Los Angeles',
              child: Text('Pacific Time (PT) - Los Angeles'),
            ),
            DropdownMenuItem(
              value: 'Eastern Time (ET) - New York',
              child: Text('Eastern Time (ET) - New York'),
            ),
            DropdownMenuItem(
              value: 'Greenwich Mean Time (GMT) - London',
              child: Text('Greenwich Mean Time (GMT) - London'),
            ),
            DropdownMenuItem(
              value: 'Central European Time (CET) - Berlin',
              child: Text('Central European Time (CET) - Berlin'),
            ),
          ],
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _stepBar({bool active = false}) {
    return Container(
      width: 32,
      height: 6,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: active ? AppThemes.primary : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _stepDot() {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
