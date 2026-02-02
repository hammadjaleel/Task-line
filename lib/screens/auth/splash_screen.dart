import 'package:flutter/material.dart';

class TasklineSplashScreen extends StatelessWidget {
  const TasklineSplashScreen({super.key});

  static const Color backgroundDark = Color(0xFF0F1115);
  static const Color primary = Color(0xFF4F8DF3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Stack(
          children: [
            /// Main Content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Mascot Container
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.list_alt,
                          size: 64,
                          color: primary,
                        ),

                        /// Owl Eye Accents
                        Positioned.fill(
                          child: Opacity(
                            opacity: 0.3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _eyeDot(),
                                  _eyeDot(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// App Name
                  const Text(
                    "Taskline",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: Color(0xFFE5E7EB),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Tagline
                  const Text(
                    "Execution clarity for small teams",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),

            /// Progress Indicator
            Positioned(
              bottom: 64,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 240,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B4554).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 80, // 1/3 width
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// iOS Home Indicator
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 120,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B4554).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _eyeDot() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
