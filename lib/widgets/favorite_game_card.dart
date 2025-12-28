import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/user_profile.dart';

/// A card widget displaying a favorite game.
///
/// Shows game icon, name, and category with hover effects.
class FavoriteGameCard extends StatelessWidget {
  const FavoriteGameCard({required this.game, required this.onTap, super.key});

  /// The favorite game to display.
  final FavoriteGame game;

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
          color: isDark ? const Color(0xFF251835) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? const Color(0xFF38264D) : Colors.grey.shade100,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDark
                    ? Color(game.iconColor).withOpacity(0.2)
                    : Color(game.backgroundColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  _getIconData(),
                  size: 28,
                  color: Color(game.iconColor),
                ),
              ),
            ),
            const Spacer(),
            // Game info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.name,
                  style: TextStyle(
                    color: isDark ? Colors.white : AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  game.category,
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textLight.withOpacity(0.5)
                        : AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData() {
    switch (game.iconName) {
      case 'swords':
        return Icons.sports_esports;
      case 'castle':
        return Icons.castle_outlined;
      case 'star':
        return Icons.star;
      case 'auto_awesome':
        return Icons.auto_awesome;
      default:
        return Icons.videogame_asset;
    }
  }
}
