import 'package:flutter/material.dart';

class FirstProjectCreationScreen extends StatelessWidget {
  const FirstProjectCreationScreen({super.key});

  static const Color primary = Color(0xFF7D4FF3);
  static const Color backgroundDark = Color(0xFF0F1115);
  static const Color whiteSoft = Colors.white54;

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
                        "ONBOARDING",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            /// Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _dot(),
                _dot(),
                _dot(),
                _dot(),
                _activeDot(),
              ],
            ),

            /// Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Illustration
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primary.withOpacity(0.2),
                            boxShadow: [
                              BoxShadow(
                                color: primary.withOpacity(0.3),
                                blurRadius: 60,
                              ),
                            ],
                          ),
                        ),
                        Image.network(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuCkgzmZPjOKQs9xxNZJIrq81KFpU4hkPr3d71gHr5O_MDUwXssZtxfMY0jZetr4OFdhz0agO1bqcX0NRnOcKJGMyQxdDxPXtuvp7x6b9e38ZUKwsg5yhnexUXmM6tI_14cx9D1F9luKXZEEJT_80PiGRAiU1wI0giuQNye48LtogBNJKYDtNw106sZ8eGzfjOuw-U33fDUZo2zf5Sgf4-AXiFNzijTCBEejVeziWABc16hge3RL6WgSnjfhSaJOhouDt9117QqDiN4",
                          width: 160,
                          height: 160,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    /// Title
                    const Text(
                      "First Project Creation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Subtitle
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "All tasks live inside projects. Let's start by naming your first one.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// Input
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PROJECT NAME",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.4,
                          color: whiteSoft,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        hintText: "e.g., Q4 Marketing Launch",
                        hintStyle: const TextStyle(color: Colors.white24),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.05),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// CTA Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Create project",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Step 5 of 5",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white30,
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

  /// Inactive Dot
  Widget _dot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }

  /// Active Dot
  Widget _activeDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 24,
      height: 6,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

