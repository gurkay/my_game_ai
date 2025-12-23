/// Represents a user's profile information.
///
/// Contains personal data, statistics, and preferences.
class UserProfile {
  const UserProfile({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.level,
    required this.levelTitle,
    required this.stats,
  });

  /// Unique identifier for the user.
  final String id;

  /// Display username.
  final String username;

  /// URL of the user's avatar image.
  final String avatarUrl;

  /// Current level (e.g., 5).
  final int level;

  /// Level title/rank (e.g., "Expert").
  final String levelTitle;

  /// User statistics.
  final ProfileStats stats;
}

/// Represents user profile statistics.
///
/// Tracks various metrics like saved items, comments, and likes.
class ProfileStats {
  const ProfileStats({
    required this.savedCount,
    required this.commentsCount,
    required this.likesCount,
  });

  /// Number of saved items.
  final int savedCount;

  /// Number of comments made.
  final int commentsCount;

  /// Number of likes received.
  final int likesCount;
}

/// Represents a favorite game entry in user's profile.
///
/// Contains game information and display preferences.
class FavoriteGame {
  const FavoriteGame({
    required this.id,
    required this.name,
    required this.category,
    required this.iconName,
    required this.iconColor,
    required this.backgroundColor,
  });

  /// Unique identifier for the game.
  final String id;

  /// Name of the game.
  final String name;

  /// Category/genre of the game.
  final String category;

  /// Material icon name for display.
  final String iconName;

  /// Hex color value for icon.
  final int iconColor;

  /// Hex color value for background.
  final int backgroundColor;
}
