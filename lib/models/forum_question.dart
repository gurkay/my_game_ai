/// Forum question and category models.
///
/// Provides sealed classes for status types and immutable data structures
/// for Q&A forum functionality.
library;

/// Represents the category of a forum question.
sealed class ForumCategory {
  /// Category name.
  final String name;

  const ForumCategory(this.name);
}

/// Strategy game category.
final class StrategyCat extends ForumCategory {
  const StrategyCat() : super('Strateji');
}

/// Battle Royale category.
final class BattleRoyaleCat extends ForumCategory {
  const BattleRoyaleCat() : super('Battle Royale');
}

/// MOBA category.
final class MobaCat extends ForumCategory {
  const MobaCat() : super('MOBA');
}

/// RPG category.
final class RpgCat extends ForumCategory {
  const RpgCat() : super('RPG');
}

/// FPS category.
final class FpsCat extends ForumCategory {
  const FpsCat() : super('FPS');
}

/// Represents question status.
sealed class QuestionStatus {
  const QuestionStatus();
}

/// Question has been solved.
final class SolvedStatus extends QuestionStatus {
  const SolvedStatus();
}

/// Question is new/active.
final class ActiveStatus extends QuestionStatus {
  const ActiveStatus();
}

/// Question is unanswered.
final class UnansweredStatus extends QuestionStatus {
  const UnansweredStatus();
}

/// Author information for a question.
final class ForumAuthor {
  /// Username.
  final String username;

  /// Avatar URL.
  final String avatarUrl;

  /// Time posted (e.g., "2 saat önce").
  final String timeAgo;

  const ForumAuthor({
    required this.username,
    required this.avatarUrl,
    required this.timeAgo,
  });
}

/// A forum question/post.
final class ForumQuestion {
  /// Question title.
  final String title;

  /// Question body/description.
  final String body;

  /// Author information.
  final ForumAuthor author;

  /// Question category.
  final ForumCategory category;

  /// Question status.
  final QuestionStatus status;

  /// Number of comments/replies.
  final int commentCount;

  /// Number of likes/upvotes.
  final int likeCount;

  /// Whether this is a highlighted/active question.
  final bool isHighlighted;

  const ForumQuestion({
    required this.title,
    required this.body,
    required this.author,
    required this.category,
    required this.status,
    required this.commentCount,
    required this.likeCount,
    this.isHighlighted = false,
  });
}
