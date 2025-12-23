/// Represents a game's detailed information.
///
/// Contains all data needed for the game detail page including
/// metadata, media, updates, and ratings.
class Game {
  const Game({
    required this.id,
    required this.title,
    required this.heroImageUrl,
    required this.genres,
    required this.version,
    required this.rating,
    required this.reviewCount,
    required this.mediaItems,
    required this.description,
    this.isFavorite = false,
  });

  /// Unique identifier for the game.
  final String id;

  /// Name of the game.
  final String title;

  /// URL for the hero/cover image.
  final String heroImageUrl;

  /// List of game genres/categories.
  final List<String> genres;

  /// Current version of the game.
  final String version;

  /// Average user rating (0-5).
  final double rating;

  /// Total number of reviews.
  final int reviewCount;

  /// Media gallery items (videos, screenshots).
  final List<MediaItem> mediaItems;

  /// Full description of the game.
  final String description;

  /// Whether the user has favorited this game.
  final bool isFavorite;

  /// Returns formatted review count string.
  ///
  /// Converts large numbers to readable format (e.g., "12b" for 12000).
  String get formattedReviewCount {
    if (reviewCount >= 1000) {
      return '${(reviewCount / 1000).toStringAsFixed(0)}b inceleme';
    }
    return '$reviewCount inceleme';
  }

  /// Creates a copy with updated fields.
  Game copyWith({
    String? id,
    String? title,
    String? heroImageUrl,
    List<String>? genres,
    String? version,
    double? rating,
    int? reviewCount,
    List<MediaItem>? mediaItems,
    String? description,
    bool? isFavorite,
  }) {
    return Game(
      id: id ?? this.id,
      title: title ?? this.title,
      heroImageUrl: heroImageUrl ?? this.heroImageUrl,
      genres: genres ?? this.genres,
      version: version ?? this.version,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      mediaItems: mediaItems ?? this.mediaItems,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

/// Represents a media item (video or image) in the game gallery.
///
/// Uses sealed class for type safety and exhaustive pattern matching.
sealed class MediaItem {
  const MediaItem({required this.thumbnailUrl, required this.label});

  /// URL for the thumbnail image.
  final String thumbnailUrl;

  /// Display label for the media item.
  final String label;
}

/// Represents a video media item.
final class VideoMediaItem extends MediaItem {
  const VideoMediaItem({
    required super.thumbnailUrl,
    required super.label,
    required this.videoUrl,
  });

  /// URL for the video content.
  final String videoUrl;
}

/// Represents an image media item.
final class ImageMediaItem extends MediaItem {
  const ImageMediaItem({required super.thumbnailUrl, required super.label});
}

/// Represents a game update/news item.
class GameUpdate {
  const GameUpdate({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.publishedAt,
  });

  /// Unique identifier for the update.
  final String id;

  /// Title of the update.
  final String title;

  /// Description or content of the update.
  final String description;

  /// Cover image URL.
  final String imageUrl;

  /// Type of update (e.g., "Güncelleme", "Etkinlik", "Bakım").
  final String type;

  /// Publication date.
  final DateTime publishedAt;

  /// Returns time elapsed since publication.
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

    if (difference.inDays > 1) {
      return '${difference.inDays} gün önce';
    } else if (difference.inDays == 1) {
      return 'Dün';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'Az önce';
    }
  }
}

/// Represents a cheat or tip for the game.
class Cheat {
  const Cheat({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.code,
    required this.icon,
  });

  /// Unique identifier for the cheat.
  final String id;

  /// Title of the cheat.
  final String title;

  /// Subtitle or additional info.
  final String subtitle;

  /// Detailed description/instructions.
  final String description;

  /// Code or command (if applicable).
  final String? code;

  /// Icon name for display.
  final String icon;
}

/// Represents rating statistics for a game.
class RatingStatistics {
  const RatingStatistics({
    required this.averageRating,
    required this.totalRatings,
    required this.fiveStarPercentage,
    required this.fourStarPercentage,
    required this.threeStarPercentage,
    required this.twoStarPercentage,
    required this.oneStarPercentage,
  });

  /// Average rating (0-5).
  final double averageRating;

  /// Total number of ratings.
  final int totalRatings;

  /// Percentage of 5-star ratings.
  final double fiveStarPercentage;

  /// Percentage of 4-star ratings.
  final double fourStarPercentage;

  /// Percentage of 3-star ratings.
  final double threeStarPercentage;

  /// Percentage of 2-star ratings.
  final double twoStarPercentage;

  /// Percentage of 1-star ratings.
  final double oneStarPercentage;

  /// Returns formatted total ratings string.
  String get formattedTotalRatings {
    if (totalRatings >= 1000) {
      return '${(totalRatings / 1000).toStringAsFixed(0)}b Oy';
    }
    return '$totalRatings Oy';
  }
}
