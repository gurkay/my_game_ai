import '../models/user_profile.dart';

/// Mock data provider for user profile.
///
/// In a real application, this would be replaced with an API service.
abstract final class MockProfileData {
  const MockProfileData._();

  /// Returns the current user's profile.
  static UserProfile get currentUser => const UserProfile(
    id: 'user-1',
    username: 'GameMaster99',
    avatarUrl: 'https://i.pravatar.cc/200?img=33',
    level: 5,
    levelTitle: 'Expert',
    stats: ProfileStats(savedCount: 12, commentsCount: 45, likesCount: 89),
  );

  /// Returns list of user's favorite games.
  static List<FavoriteGame> get favoriteGames => const [
    FavoriteGame(
      id: 'pubg',
      name: 'PUBG Mobile',
      category: 'Battle Royale',
      iconName: 'swords',
      iconColor: 0xFFEA580C,
      backgroundColor: 0xFFFED7AA,
    ),
    FavoriteGame(
      id: 'coc',
      name: 'Clash of Clans',
      category: 'Strateji',
      iconName: 'castle',
      iconColor: 0xFFCA8A04,
      backgroundColor: 0xFFFEF3C7,
    ),
    FavoriteGame(
      id: 'brawl',
      name: 'Brawl Stars',
      category: 'Aksiyon',
      iconName: 'star',
      iconColor: 0xFF2563EB,
      backgroundColor: 0xFFBFDBFE,
    ),
    FavoriteGame(
      id: 'genshin',
      name: 'Genshin Impact',
      category: 'RPG',
      iconName: 'auto_awesome',
      iconColor: 0xFF9333EA,
      backgroundColor: 0xFFE9D5FF,
    ),
  ];
}
