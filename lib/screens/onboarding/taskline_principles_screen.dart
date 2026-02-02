import 'package:flutter/material.dart';

class TasklinePrinciplesScreen extends StatelessWidget {
  const TasklinePrinciplesScreen({super.key});

  static const Color primary = Color(0xFF7D4FF3);
  static const Color success = Color(0xFF22C55E);
  static const Color backgroundDark = Color(0xFF151022);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            /// Top App Bar
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
                        "STEP 6 OF 6",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.6,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            /// Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: primary.withOpacity(0.3)),
                    ),
                    child: const Icon(
                      Icons.verified_user,
                      size: 36,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "The Taskline Way",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Our core philosophy for high-performance execution.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Principles List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    _PrincipleCard(
                      title: "One task = one owner",
                      description:
                          "Accountability is the core of speed. Every action item has a single point of truth.",
                    ),
                    SizedBox(height: 16),
                    _PrincipleCard(
                      title: "Status changes are explicit",
                      description:
                          "No ambiguity in progress. If it's not updated, it's not moving.",
                    ),
                    SizedBox(height: 16),
                    _PrincipleCard(
                      title: "AI suggests, humans decide",
                      description:
                          "You are always in control. Our engine assists, but you drive the execution.",
                    ),
                  ],
                ),
              ),
            ),

            /// Footer / CTA
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Column(
                children: [
                  /// Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _dot(),
                      _dot(),
                      _dot(),
                      _dot(),
                      _dot(),
                      _activeDot(),
                    ],
                  ),
                  const SizedBox(height: 28),

                  /// CTA Button
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
                      onPressed: () {
                        // Navigate to Home / My Focus
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Go to My Focus",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "READY FOR HIGH-PERFORMANCE WORK",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1.4,
                      color: Colors.white30,
                      fontWeight: FontWeight.w500,
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

  /// Inactive dot
  static Widget _dot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }

  /// Active dot
  static Widget _activeDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 24,
      height: 6,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

/// Reusable Principle Card
class _PrincipleCard extends StatelessWidget {
  final String title;
  final String description;

  const _PrincipleCard({
    required this.title,
    required this.description,
  });

  static const Color success = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: success,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

