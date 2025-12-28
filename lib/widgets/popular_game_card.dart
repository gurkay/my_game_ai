import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/cheat_item.dart';

/// Widget displaying a popular game in the carousel.
///
/// Shows game icon with gradient border for featured games.
class PopularGameCard extends StatelessWidget {
  /// The popular game to display.
  final PopularGame game;

  /// Callback when tapped.
  final VoidCallback? onTap;

  const PopularGameCard({required this.game, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Icon with gradient border
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: game.isFeatured
                  ? const LinearGradient(
                      colors: [AppColors.primary, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              border: !game.isFeatured
                  ? Border.all(color: Colors.white.withOpacity(0.1), width: 2)
                  : null,
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.backgroundDark, width: 2),
              ),
              child: ClipOval(
                child: Image.network(game.iconUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Game name
          Text(
            game.displayName,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
