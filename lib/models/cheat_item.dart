/// Cheat and guide models for games.
///
/// Provides sealed classes for cheat types and immutable data structures
/// for game cheats, codes, and guides.
library;

/// Represents the type of cheat/guide.
sealed class CheatType {
  const CheatType();
}

/// Cheat code that can be copied.
final class CodeCheat extends CheatType {
  /// Platform name (e.g., "PlayStation", "Xbox").
  final String platform;

  const CodeCheat(this.platform);
}

/// Console command that can be copied.
final class CommandCheat extends CheatType {
  /// Platform name (e.g., "PC/Mobil").
  final String platform;

  const CommandCheat(this.platform);
}

/// Guide or walkthrough.
final class GuideCheat extends CheatType {
  const GuideCheat();
}

/// Strategy or tactic.
final class StrategyCheat extends CheatType {
  const StrategyCheat();
}

/// Status of cheat (working, verified, etc.).
sealed class CheatStatus {
  /// Display text.
  final String text;

  /// Status color identifier.
  final String color;

  const CheatStatus(this.text, this.color);
}

/// Cheat is working/verified.
final class WorkingStatus extends CheatStatus {
  const WorkingStatus() : super('Çalışıyor', 'green');
}

/// Platform-specific status.
final class PlatformStatus extends CheatStatus {
  const PlatformStatus(String platform) : super(platform, 'green');
}

/// Guide status.
final class GuideStatus extends CheatStatus {
  const GuideStatus() : super('Rehber', 'blue');
}

/// Strategy/tactic status.
final class TacticStatus extends CheatStatus {
  const TacticStatus() : super('Taktik', 'orange');
}

/// A cheat, code, or guide item.
final class CheatItem {
  /// Game name.
  final String gameName;

  /// Game icon URL.
  final String gameIconUrl;

  /// Cheat title/description.
  final String title;

  /// Cheat type.
  final CheatType type;

  /// Status badge.
  final CheatStatus status;

  /// Code/command text (for code/command types).
  final String? code;

  /// Full description (for guide/strategy types).
  final String? description;

  const CheatItem({
    required this.gameName,
    required this.gameIconUrl,
    required this.title,
    required this.type,
    required this.status,
    this.code,
    this.description,
  });
}

/// Popular game for carousel.
final class PopularGame {
  /// Game name.
  final String name;

  /// Display name (short).
  final String displayName;

  /// Game icon URL.
  final String iconUrl;

  /// Whether this is featured/highlighted.
  final bool isFeatured;

  const PopularGame({
    required this.name,
    required this.displayName,
    required this.iconUrl,
    this.isFeatured = false,
  });
}
