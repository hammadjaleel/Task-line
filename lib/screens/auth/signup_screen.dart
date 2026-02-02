// signup_screen.dart
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const Color backgroundDark = Color(0xFF101722);
  static const Color surfaceDark = Color(0xFF181B22);
  static const Color primary = Color(0xFF4F8DF3);
  static const Color borderGray = Color(0xFF3B4554);
  static const Color textGray = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 430),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  /// Top App Bar
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      const Expanded(
                        child: Text(
                          "Join App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // To balance the back button
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// Headline
                  const Text(
                    "Create your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Professional task execution for teams.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9DA8B9),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// Input Fields
                  Column(
                    children: [
                      _InputField(
                        label: "Email",
                        hint: "name@company.com",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(height: 16),
                      _PasswordField(label: "Password", hint: "Min. 8 characters"),
                      const SizedBox(height: 16),
                      _PasswordField(label: "Confirm Password", hint: "Repeat password"),
                    ],
                  ),

                  const SizedBox(height: 32),

                  /// Primary Action Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      minimumSize: const Size.fromHeight(56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: primary.withOpacity(0.2),
                      elevation: 8,
                    ),
                    child: const Text(
                      "Create account",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// Divider
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: borderGray.withOpacity(0.5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or sign up with",
                          style: TextStyle(
                            color: Color(0xFF9DA8B9),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: borderGray.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// OAuth Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _OAuthButton(
                          icon: Icons.g_mobiledata, // Replace with actual Google SVG if needed
                          label: "Google",
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _OAuthButton(
                          icon: Icons.code, // Replace with GitHub SVG if needed
                          label: "GitHub",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  /// Footer Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Color(0xFF9DA8B9),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Generic Input Field
class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;

  const _InputField({
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFE5E7EB), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9DA8B9)),
            filled: true,
            fillColor: SignUpScreen.surfaceDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: SignUpScreen.borderGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: SignUpScreen.primary),
            ),
          ),
        ),
      ],
    );
  }
}

/// Password Field with visibility icon
class _PasswordField extends StatefulWidget {
  final String label;
  final String hint;

  const _PasswordField({required this.label, required this.hint});

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(color: Color(0xFFE5E7EB), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextField(
          obscureText: _obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Color(0xFF9DA8B9)),
            filled: true,
            fillColor: SignUpScreen.surfaceDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: SignUpScreen.borderGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: SignUpScreen.primary),
            ),
            suffixIcon: IconButton(
              icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off, color: const Color(0xFF9DA8B9)),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),
        ),
      ],
    );
  }
}

/// OAuth Button
class _OAuthButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _OAuthButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      style: ElevatedButton.styleFrom(
        backgroundColor: SignUpScreen.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: SignUpScreen.borderGray),
      ),
    );
  }
}
