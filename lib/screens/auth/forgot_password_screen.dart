// forgot_password_screen.dart
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  static const Color backgroundDark = Color(0xFF0F1115);
  static const Color backgroundLight = Color(0xFFF6F7F8);
  static const Color primary = Color(0xFF4F8DF3);
  static const Color surfaceDark = Color(0xFF1C2027);
  static const Color borderGray = Color(0xFF3B4554);
  static const Color textLight = Colors.white;
  static const Color textDark = Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? backgroundDark : backgroundLight,
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 480),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                /// Top Navigation / Back Button
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.chevron_left, color: primary, size: 28),
                      label: const Text(
                        "Login",
                        style: TextStyle(
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// Icon / Brand Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.lock_reset,
                    color: primary,
                    size: 32,
                  ),
                ),

                const SizedBox(height: 32),

                /// Headline
                Text(
                  "Reset your password",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? textLight : textDark,
                  ),
                ),
                const SizedBox(height: 12),

                /// Body Text
                Text(
                  "Enter your email to receive a recovery link. We'll help you get back to your tasks in no time.",
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                /// Email Field
                _InputField(
                  label: "Work Email",
                  hint: "name@company.com",
                  isDarkMode: isDarkMode,
                ),

                const SizedBox(height: 24),

                /// Send Reset Link Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 6,
                    ),
                    child: const Text(
                      "Send reset link",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                /// Footer / Contact Support
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: RichText(
                      text: TextSpan(
                        text: "Having trouble? ",
                        style: TextStyle(
                          color: isDarkMode ? Colors.grey[500] : Colors.grey[600],
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: "Contact Support",
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      /// Optional Background Decoration
      bottomSheet: SizedBox(
        width: 400,
        height: 400,
        child: CustomPaint(
          painter: _GradientCirclePainter(isDarkMode: isDarkMode),
        ),
      ),
    );
  }
}

/// Generic Input Field
class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isDarkMode;

  const _InputField({required this.label, required this.hint, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
            filled: true,
            fillColor: isDarkMode ? Color(0xFF1C2027) : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: isDarkMode ? Color(0xFF3B4554) : Colors.grey[200]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFF4F8DF3)),
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom Painter for the subtle radial gradient circle
class _GradientCirclePainter extends CustomPainter {
  final bool isDarkMode;

  _GradientCirclePainter({required this.isDarkMode});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Color(0xFF4F8DF3),
        ],
        center: const Alignment(0.75, 0.75),
        radius: 1.0,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.srcOver;

    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.75), 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
