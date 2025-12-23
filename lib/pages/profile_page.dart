import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/mock_profile_data.dart';
import '../models/user_profile.dart';
import '../widgets/add_game_card.dart';
import '../widgets/favorite_game_card.dart';
import '../widgets/profile_stat_card.dart';

/// The user profile page displaying personal information and statistics.
///
/// Features avatar, level badge, statistics, and favorite games.
/// Follows SRP by delegating rendering to specialized widgets.
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = ['Favori Oyunlar', 'Kaydedilenler', 'Soru-Cevap'];

  @override
  Widget build(BuildContext context) {
    final profile = MockProfileData.currentUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(isDark),
          _buildProfileHeader(profile, isDark),
          _buildStats(profile.stats),
          _buildTabBar(isDark),
          _buildTabContent(),
        ],
      ),
    );
  }

  Widget _buildAppBar(bool isDark) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor:
          (isDark ? AppColors.backgroundDark : AppColors.backgroundLight)
              .withOpacity(0.9),
      elevation: 0,
      title: const Text(
        'Profilim',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            debugPrint('Settings tapped');
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade200,
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfile profile, bool isDark) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
        child: Column(
          children: [
            // Avatar with gradient border and edit button
            Stack(
              children: [
                // Gradient glow effect
                Container(
                  width: 116,
                  height: 116,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, Color(0xFF9D4EDD)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                ),
                // Avatar
                Container(
                  width: 116,
                  height: 116,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark
                          ? AppColors.backgroundDark
                          : AppColors.backgroundLight,
                      width: 4,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(profile.avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Edit button
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark
                            ? AppColors.backgroundDark
                            : AppColors.backgroundLight,
                        width: 4,
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Username
            Text(
              profile.username,
              style: TextStyle(
                color: isDark ? Colors.white : AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            // Level badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.military_tech,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Level ${profile.level} - ${profile.levelTitle}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Edit profile button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Edit profile tapped');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                  shadowColor: AppColors.primary.withOpacity(0.3),
                ),
                child: const Text(
                  'Profili Düzenle',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStats(ProfileStats stats) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          children: [
            Expanded(
              child: ProfileStatCard(
                value: stats.savedCount,
                label: 'Kaydedilen',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ProfileStatCard(
                value: stats.commentsCount,
                label: 'Yorumlar',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ProfileStatCard(
                value: stats.likesCount,
                label: 'Beğeniler',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(bool isDark) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _ProfileTabBarDelegate(
        Container(
          color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          child: Column(
            children: [
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.grey.shade200,
                    ),
                  ),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 24),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedTabIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.primary
                                : (isDark
                                      ? AppColors.textLight.withOpacity(0.5)
                                      : AppColors.textSecondary),
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final games = MockProfileData.favoriteGames;

          if (index < games.length) {
            return FavoriteGameCard(
              game: games[index],
              onTap: () {
                debugPrint('Game tapped: ${games[index].name}');
              },
            );
          } else if (index == games.length) {
            return AddGameCard(
              onTap: () {
                debugPrint('Add game tapped');
              },
            );
          }
          return null;
        }, childCount: MockProfileData.favoriteGames.length + 1),
      ),
    );
  }
}

/// Custom delegate for sticky tab bar.
class _ProfileTabBarDelegate extends SliverPersistentHeaderDelegate {
  _ProfileTabBarDelegate(this.child);

  final Widget child;

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(_ProfileTabBarDelegate oldDelegate) => false;
}
