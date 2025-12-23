/// System requirement models for games.
///
/// Provides sealed classes for requirement types and immutable data structures
/// for device compatibility checking.
library;

/// Represents the type of system requirement specification.
sealed class RequirementType {
  const RequirementType();
}

/// Minimum system requirement.
final class MinimumRequirement extends RequirementType {
  const MinimumRequirement();
}

/// Recommended system requirement.
final class RecommendedRequirement extends RequirementType {
  const RecommendedRequirement();
}

/// Individual specification item (OS, CPU, RAM, etc.).
final class SpecItem {
  /// The name/label of the specification.
  final String label;

  /// The main value (e.g., "Android 10+", "8 GB").
  final String value;

  /// Optional subtitle/additional info.
  final String? subtitle;

  /// Icon name for the spec.
  final String icon;

  /// Color for the icon background.
  final String color;

  const SpecItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.subtitle,
  });
}

/// User's device information.
final class DeviceInfo {
  /// Device model name.
  final String deviceModel;

  /// Whether device meets recommended requirements.
  final bool meetsRecommended;

  /// Compatibility message.
  final String compatibilityMessage;

  const DeviceInfo({
    required this.deviceModel,
    required this.meetsRecommended,
    required this.compatibilityMessage,
  });
}

/// Complete system requirements for a game.
final class SystemRequirement {
  /// The game these requirements are for.
  final String gameTitle;

  /// Game version.
  final String version;

  /// Game category.
  final String category;

  /// Rating.
  final double rating;

  /// Review count text.
  final String reviewCount;

  /// Icon URL.
  final String iconUrl;

  /// User's device info.
  final DeviceInfo deviceInfo;

  /// Minimum requirement specs.
  final List<SpecItem> minimumSpecs;

  /// Recommended requirement specs.
  final List<SpecItem> recommendedSpecs;

  /// Performance demand level (0-100).
  final int performanceDemand;

  /// Performance level text (e.g., "Yüksek").
  final String performanceLevel;

  /// Performance warning message.
  final String? performanceWarning;

  /// Internet requirement text.
  final String internetRequirement;

  const SystemRequirement({
    required this.gameTitle,
    required this.version,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.iconUrl,
    required this.deviceInfo,
    required this.minimumSpecs,
    required this.recommendedSpecs,
    required this.performanceDemand,
    required this.performanceLevel,
    this.performanceWarning,
    required this.internetRequirement,
  });
}
