import 'package:flutter/material.dart';

class InviteTeammatesScreen extends StatelessWidget {
  const InviteTeammatesScreen({super.key});

  static const Color primary = Color(0xFF7D4FF3);
  static const Color backgroundDark = Color(0xFF151022);
  static const Color cardDark = Color(0xFF1F1C27);
  static const Color borderDark = Color(0xFF423B54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Stack(
          children: [
            /// Decorative gradient (top-right)
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.3),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(0.4),
                      blurRadius: 100,
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                /// Top Bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Step 4 of 5",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                /// Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),

                        /// Title
                        const Text(
                          "Invite your team",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Taskline works best when your team is aligned and executing together.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white60,
                          ),
                        ),

                        const SizedBox(height: 32),

                        /// Email Input
                        const Text(
                          "Team member email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "enter.email@company.com",
                                  hintStyle: const TextStyle(color: Color(0xFFA59DB9)),
                                  filled: true,
                                  fillColor: cardDark,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(color: borderDark),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                    ),
                                    borderSide: const BorderSide(color: primary),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        /// Added Teammates
                        const Text(
                          "ADDED TEAMMATES",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.white38,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: const [
                            _EmailChip(email: "sarah@taskline.com"),
                            _EmailChip(email: "dev-team@taskline.com"),
                          ],
                        ),

                        const SizedBox(height: 48),

                        /// Illustration
                        Opacity(
                          opacity: 0.25,
                          child: Center(
                            child: Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    primary.withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.group_add,
                                size: 96,
                                color: primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Bottom Actions
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 8,
                            shadowColor: primary.withOpacity(0.4),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Skip for now",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Email Chip Widget
class _EmailChip extends StatelessWidget {
  final String email;

  const _EmailChip({required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: InviteTeammatesScreen.cardDark,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: InviteTeammatesScreen.borderDark),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            email,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.close,
            size: 18,
            color: Color(0xFFA59DB9),
          ),
        ],
      ),
    );
  }
}

