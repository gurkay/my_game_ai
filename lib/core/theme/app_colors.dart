import 'package:flutter/material.dart';

/// Application color palette matching the HTML design.
///
/// Uses const values for compile-time optimization.
/// All colors are defined in one place for easy maintenance (DRY principle).
abstract final class AppColors {
  const AppColors._();

  // Primary colors
  static const Color primary = Color(0xFF7F0DF2);
  static const Color primaryLight = Color(0xFFAD90CB);

  // Background colors
  static const Color backgroundLight = Color(0xFFF7F5F8);
  static const Color backgroundDark = Color(0xFF191022);

  // Surface colors
  static const Color surfaceDark = Color(0xFF261834);
  static const Color surfaceHighlight = Color(0xFF362249);
  static const Color surfaceLight = Colors.white;

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF0EA5E9);

  // Text colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textLight = Colors.white;

  // Category badge colors
  static const Color categoryTips = Color(0xFF10B981);
  static const Color categoryNews = Color(0xFF60A5FA);
  static const Color categoryEvent = Color(0xFFF59E0B);
  static const Color categoryQA = Color(0xFFA78BFA);

  // Gradient colors for AI button
  static const LinearGradient aiButtonGradient = LinearGradient(
    colors: [Color(0xFF0EA5E9), Color(0xFF22D3EE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
