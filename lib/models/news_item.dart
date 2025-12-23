import 'news_category.dart';

/// Represents a news item with all required information.
///
/// Uses immutable data structure with const constructor for performance.
class NewsItem {
  const NewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.publishedAt,
    this.viewCount,
    this.commentCount,
    this.likeCount,
    this.isFeatured = false,
  });

  /// Unique identifier for the news item.
  final String id;

  /// Title of the news article.
  final String title;

  /// Brief description or excerpt of the article.
  final String description;

  /// URL of the article's cover image.
  final String imageUrl;

  /// Category of the news item.
  final NewsCategory category;

  /// Publication date of the article.
  final DateTime publishedAt;

  /// Number of views (optional).
  final int? viewCount;

  /// Number of comments (optional).
  final int? commentCount;

  /// Number of likes (optional).
  final int? likeCount;

  /// Whether this is a featured article shown at the top.
  final bool isFeatured;

  /// Returns a formatted string of time elapsed since publication.
  ///
  /// Examples: "2 saat önce", "1 gün önce", "3 dakika önce"
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

    if (difference.inDays > 0) {
      return '${difference.inDays} gün önce';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'Az önce';
    }
  }

  /// Returns formatted view count string.
  ///
  /// Converts large numbers to readable format (e.g., "1.2b" for 1200).
  String get formattedViewCount {
    if (viewCount == null) return '';
    if (viewCount! >= 1000) {
      return '${(viewCount! / 1000).toStringAsFixed(1)}b görüntülenme';
    }
    return '$viewCount görüntülenme';
  }
}
