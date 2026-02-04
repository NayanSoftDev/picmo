import 'package:flutter/material.dart';

class CustomBackgroundColors {
  /// ========= TOP COLORS =========
  /// Slight dark-blue & purple mood like your screenshot
  static const Color topDark = Color(0xFF050505);
  static const Color topBlue = Color(0xFF0A1A33);
  static const Color topPurple = Color(0xFF1C0A2E);

  /// ========= BOTTOM Figma Glow COLORS =========
  /// (Your given gradient)
  static const Color bottomCyan = Color(0xFF00C6FF); // #00C6FF
  static const Color bottomIndigo = Color(0xFF552BFF); // #552BFF
  static const Color bottomMagenta = Color(0xFFD000FF); // #D000FF

  /// ========= MAIN BACKGROUND GRADIENT =========
  /// Top dark → smooth black → bottom neon glow
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 52, 28, 131),
      topBlue,
      topPurple,
      Colors.black, // middle dark section
      Color.fromARGB(225, 32, 14, 60), // core bright
      Color.fromARGB(120, 118, 38, 238), // faded mid
      Color.fromARGB(
          188, 118, 38, 238), // transparent edge// strongest bottom glow
    ],
    stops: [
      0.0, // top
      0.15,
      0.25,
      0.45,
      0.70,
      0.85,
      1.0, // bottom
    ],
  );

  static Gradient? get buttonGradient => null;
}
