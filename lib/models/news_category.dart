/// Represents a news category type.
///
/// Uses sealed class for exhaustive pattern matching ensuring
/// all category types are handled at compile time.
sealed class NewsCategory {
  const NewsCategory();

  /// Returns the display name for this category.
  String get displayName;

  /// Returns the background color for this category badge.
  int get colorValue;
}

/// News category.
final class NewsCategoryNews extends NewsCategory {
  const NewsCategoryNews();

  @override
  String get displayName => 'Haberler';

  @override
  int get colorValue => 0xFF60A5FA;
}

/// Tips/cheats category.
final class NewsCategoryTips extends NewsCategory {
  const NewsCategoryTips();

  @override
  String get displayName => 'Hileler';

  @override
  int get colorValue => 0xFF10B981;
}

/// Event category.
final class NewsCategoryEvent extends NewsCategory {
  const NewsCategoryEvent();

  @override
  String get displayName => 'Etkinlik';

  @override
  int get colorValue => 0xFFF59E0B;
}

/// Q&A category.
final class NewsCategoryQA extends NewsCategory {
  const NewsCategoryQA();

  @override
  String get displayName => 'Soru-Cevap';

  @override
  int get colorValue => 0xFFA78BFA;
}

/// Updates category.
final class NewsCategoryUpdates extends NewsCategory {
  const NewsCategoryUpdates();

  @override
  String get displayName => 'Güncellemeler';

  @override
  int get colorValue => 0xFF8B5CF6;
}
