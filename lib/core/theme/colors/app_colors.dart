import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand color (Spiced Tomato)
  static const Color primary = Color(0xFF0EB29A);

  // Secondary brand color (Olive Mint)
  static const Color secondary = Color(0xFFA9CBB7);

  // Accent color for CTAs (Saffron Yellow)
  static const Color accent = Color(0xFFFFD365);

  // Neutral background color (Soft Sand)
  static const Color neutralBackground = Color(0xFFF9F4EF);

  // Typography color (Charcoal Gray)
  static const Color typography = Color(0xFF2F2F2F);

  // Optional gradient (Tomato → Apricot)
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFFD94F30), Color(0xFFF7A072)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
