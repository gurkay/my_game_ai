import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/game.dart';

/// A widget displaying rating statistics with visual breakdown.
///
/// Shows average rating, total ratings, and percentage distribution.
class RatingStatisticsCard extends StatelessWidget {
  const RatingStatisticsCard({required this.statistics, super.key});

  /// The rating statistics to display.
  final RatingStatistics statistics;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF231730) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Average rating section
          _buildAverageRating(),
          const SizedBox(width: 24),
          // Rating breakdown
          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, statistics.fiveStarPercentage),
                const SizedBox(height: 8),
                _buildRatingBar(4, statistics.fourStarPercentage),
                const SizedBox(height: 8),
                _buildRatingBar(3, statistics.threeStarPercentage),
                const SizedBox(height: 8),
                _buildRatingBar(2, statistics.twoStarPercentage),
                const SizedBox(height: 8),
                _buildRatingBar(1, statistics.oneStarPercentage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAverageRating() {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Text(
            statistics.averageRating.toStringAsFixed(1),
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final fullStars = statistics.averageRating.floor();
              final hasHalfStar = statistics.averageRating - fullStars >= 0.5;

              if (index < fullStars) {
                return const Icon(
                  Icons.star,
                  size: 16,
                  color: AppColors.primary,
                );
              } else if (index == fullStars && hasHalfStar) {
                return const Icon(
                  Icons.star_half,
                  size: 16,
                  color: AppColors.primary,
                );
              } else {
                return Icon(
                  Icons.star_border,
                  size: 16,
                  color: AppColors.primary.withOpacity(0.3),
                );
              }
            }),
          ),
          const SizedBox(height: 8),
          Text(
            statistics.formattedTotalRatings,
            style: const TextStyle(color: AppColors.textTertiary, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        // Star number
        SizedBox(
          width: 12,
          child: Text(
            '$stars',
            style: const TextStyle(
              color: AppColors.textTertiary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Progress bar
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 6,
              child: Stack(
                children: [
                  // Background
                  Container(color: AppColors.textTertiary.withOpacity(0.1)),
                  // Progress
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percentage / 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, Color(0xFF9D4EDD)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Percentage
        SizedBox(
          width: 35,
          child: Text(
            '${percentage.toInt()}%',
            style: const TextStyle(color: AppColors.textTertiary, fontSize: 12),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
