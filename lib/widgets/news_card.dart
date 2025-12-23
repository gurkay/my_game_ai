import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/news_item.dart';

/// A card widget displaying a news item in the list.
///
/// Follows SRP by focusing only on displaying news information.
/// Uses const where possible for performance.
class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsItem, required this.onTap, super.key});

  /// The news item to display.
  final NewsItem newsItem;

  /// Callback when the card is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryBadge(),
                  const SizedBox(height: 8),
                  _buildTitle(isDark),
                  const SizedBox(height: 8),
                  _buildMetadata(isDark),
                ],
              ),
            ),
            const SizedBox(width: 16),
            _buildThumbnail(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Color(newsItem.category.colorValue).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            newsItem.category.displayName.toUpperCase(),
            style: TextStyle(
              color: Color(newsItem.category.colorValue),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          newsItem.timeAgo,
          style: const TextStyle(color: AppColors.textTertiary, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildTitle(bool isDark) {
    return Text(
      newsItem.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: isDark ? AppColors.textLight : AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
    );
  }

  Widget _buildMetadata(bool isDark) {
    String metadata = '';
    IconData icon = Icons.visibility_outlined;

    if (newsItem.viewCount != null) {
      metadata = newsItem.formattedViewCount;
      icon = Icons.visibility_outlined;
    } else if (newsItem.commentCount != null) {
      metadata = '${newsItem.commentCount} yorum';
      icon = Icons.chat_bubble_outline;
    } else if (newsItem.likeCount != null) {
      metadata = '${newsItem.likeCount} beğeni';
      icon = Icons.thumb_up_outlined;
    }

    if (metadata.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          metadata,
          style: const TextStyle(color: AppColors.textTertiary, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          color: AppColors.textTertiary.withOpacity(0.1),
        ),
        child: Image.network(
          newsItem.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.textTertiary.withOpacity(0.1),
            child: const Icon(
              Icons.image_outlined,
              size: 32,
              color: AppColors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
