import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// A card widget for adding a new favorite game.
///
/// Displays a dashed border with an add icon.
class AddGameCard extends StatelessWidget {
  const AddGameCard({required this.onTap, super.key});

  /// Callback when the card is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? const Color(0xFF38264D) : Colors.grey.shade300,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 40,
              color: isDark
                  ? AppColors.textLight.withOpacity(0.4)
                  : AppColors.textTertiary,
            ),
            const SizedBox(height: 8),
            Text(
              'Oyun Ekle',
              style: TextStyle(
                color: isDark
                    ? AppColors.textLight.withOpacity(0.4)
                    : AppColors.textTertiary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
