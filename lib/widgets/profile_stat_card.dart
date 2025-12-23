import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// A widget displaying a single statistic card.
///
/// Shows a number value with a label below it.
class ProfileStatCard extends StatelessWidget {
  const ProfileStatCard({required this.value, required this.label, super.key});

  /// The statistic value to display.
  final int value;

  /// The label describing the statistic.
  final String label;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF251835) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF38264D) : Colors.grey.shade100,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value.toString(),
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: isDark
                  ? AppColors.textLight.withOpacity(0.5)
                  : AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
