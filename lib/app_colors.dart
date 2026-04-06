import 'package:flutter/material.dart';

/// Central palette — use these instead of hex literals in widgets.
class AppColors {
  AppColors._();

  static const Color accent = Color(0xFF9C6B73);
  static const Color accentHeading = Color(0xFFBC7A88);
  static const Color rose = Color(0xFFB1747C);
  static const Color roseLight = Color(0xFFC98A92);
  static const Color dotInactive = Color(0xFFD9D9D9);

  static const Color sky = Color(0xFF91DDFF);
  static const Color slate = Color(0xFF7A9EAE);
  static const Color lightBackground = Color(0xFFF7F2F3);
  static const Color border = Color(0xFFE4DCDC);

  static const LinearGradient translateButtonGradient = LinearGradient(
    colors: <Color>[roseLight, rose],
  );
}
