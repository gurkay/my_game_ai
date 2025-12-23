import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/mock_game_data.dart';
import '../data/mock_news_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/featured_news_card.dart';
import '../widgets/news_card.dart';
import 'game_detail_page.dart';
import 'profile_page.dart';

/// The main homepage screen displaying news feed.
///
/// Follows SRP by focusing on layout and composition.
/// Business logic is kept minimal and delegated to appropriate classes.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Tümü',
    'Haberler',
    'Hileler',
    'Güncellemeler',
    'Soru-Cevap',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Main content with scrollable list
            CustomScrollView(
              slivers: [
                _buildHeader(),
                _buildWelcomeSection(),
                _buildCategoryFilters(),
                _buildFeaturedSection(),
                _buildRecentNewsHeader(),
                _buildRecentNewsList(),
                // Bottom padding for navigation bar
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
            // AI floating action button
            _buildAIButton(),
            // Bottom navigation bar
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: (isDark ? AppColors.backgroundDark : AppColors.backgroundLight)
              .withOpacity(0.9),
        ),
        child: Row(
          children: [
            // User avatar with online indicator
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                    image: const DecorationImage(
                      image: NetworkImage('https://i.pravatar.cc/150?img=12'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark
                            ? AppColors.backgroundDark
                            : AppColors.backgroundLight,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            // Welcome text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoş geldin,',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.primaryLight
                        : AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Batuhan',
                  style: TextStyle(
                    color: isDark ? AppColors.textLight : AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Action buttons
            _buildIconButton(Icons.search, () {}),
            const SizedBox(width: 8),
            _buildIconButton(
              Icons.notifications_outlined,
              () {},
              hasNotification: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    IconData icon,
    VoidCallback onTap, {
    bool hasNotification = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(icon, size: 20),
            color: isDark ? AppColors.textLight : AppColors.textPrimary,
            onPressed: onTap,
            padding: EdgeInsets.zero,
          ),
        ),
        if (hasNotification)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Text(
          'Bugün ne oynamak istersin?',
          style: TextStyle(
            color: isDark ? AppColors.textLight : AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 64,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return CategoryChip(
              label: _categories[index],
              isSelected: _selectedCategoryIndex == index,
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: FeaturedNewsCard(
          newsItem: MockNewsData.featuredNews,
          onTap: () {
            // Navigate to game detail page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    GameDetailPage(game: MockGameData.cyberLegends),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRecentNewsHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'En Yeniler',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textLight
                    : AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton(
              onPressed: () {
                debugPrint('View all news tapped');
              },
              child: const Text(
                'Tümünü Gör',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentNewsList() {
    final recentNews = MockNewsData.recentNews;

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            index == recentNews.length - 1 ? 0 : 16,
          ),
          child: NewsCard(
            newsItem: recentNews[index],
            onTap: () {
              debugPrint('News tapped: ${recentNews[index].id}');
            },
          ),
        );
      }, childCount: recentNews.length),
    );
  }

  Widget _buildAIButton() {
    return Positioned(
      bottom: 112,
      right: 16,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: AppColors.aiButtonGradient,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.info.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              debugPrint('AI button tapped');
            },
            customBorder: const CircleBorder(),
            child: const Icon(
              Icons.smart_toy_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 24,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.surfaceDark.withOpacity(0.9),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Anasayfa', isSelected: true),
                _buildNavItem(Icons.explore_outlined, null),
                const SizedBox(width: 56), // Space for center FAB
                _buildNavItem(Icons.forum_outlined, null),
                _buildNavItem(
                  Icons.person_outline,
                  null,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Center FAB
          Positioned(
            left: 0,
            right: 0,
            top: -28,
            child: Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF9D4EDD)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      debugPrint('Center FAB tapped');
                    },
                    customBorder: const CircleBorder(),
                    child: const Icon(Icons.add, color: Colors.white, size: 32),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String? label, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textTertiary,
              size: 24,
            ),
            if (label != null) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
