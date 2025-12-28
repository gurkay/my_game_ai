import '../models/cheat_item.dart';

/// Extended cheat information with steps, video, and comments.
final class CheatDetail {
  /// The base cheat item.
  final CheatItem cheat;

  /// Detailed description.
  final String description;

  /// Warning message (if any).
  final String? warning;

  /// Step-by-step instructions.
  final List<CheatStep> steps;

  /// Video URL (if available).
  final String? videoUrl;

  /// Video thumbnail URL.
  final String? videoThumbnail;

  /// Video duration text.
  final String? videoDuration;

  /// Rating (0-5).
  final double rating;

  /// Number of votes.
  final String voteCount;

  /// Comments.
  final List<CheatComment> comments;

  const CheatDetail({
    required this.cheat,
    required this.description,
    this.warning,
    required this.steps,
    this.videoUrl,
    this.videoThumbnail,
    this.videoDuration,
    required this.rating,
    required this.voteCount,
    required this.comments,
  });
}

/// A single step in the instructions.
final class CheatStep {
  /// Step number.
  final int number;

  /// Step title.
  final String title;

  /// Step description.
  final String description;

  const CheatStep({
    required this.number,
    required this.title,
    required this.description,
  });
}

/// A comment on the cheat.
final class CheatComment {
  /// Commenter name.
  final String username;

  /// Avatar URL.
  final String avatarUrl;

  /// Comment text.
  final String text;

  /// Time ago text.
  final String timeAgo;

  /// Number of likes.
  final int likes;

  const CheatComment({
    required this.username,
    required this.avatarUrl,
    required this.text,
    required this.timeAgo,
    required this.likes,
  });
}
