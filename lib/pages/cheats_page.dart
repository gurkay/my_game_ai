import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/mock_cheat_data.dart';
import '../widgets/cheat_card_widget.dart';
import '../widgets/popular_game_card.dart';

/// Cheats library page with search, filters, and cheat list.
///
/// Displays game cheats, codes, guides, and strategies.
class CheatsPage extends StatefulWidget {
  const CheatsPage({super.key});

  @override
  State<CheatsPage> createState() => _CheatsPageState();
}

class _CheatsPageState extends State<CheatsPage> {
  String _selectedFilter = 'Tümü';
  final List<String> _filters = ['Tümü', 'Popüler', 'FPS', 'RPG', 'Strateji'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(child: _buildSearchBar()),
          SliverToBoxAdapter(child: _buildFilterChips()),
          SliverToBoxAdapter(child: _buildPopularGames()),
          SliverToBoxAdapter(child: _buildAIPromoBanner()),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: _buildCheatsList(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundDark.withOpacity(0.9),
      pinned: true,
      elevation: 0,
      title: const Text(
        'Hile Kütüphanesi',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.tune, color: AppColors.primary),
          onPressed: () {
            debugPrint('Settings tapped');
          },
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Oyun veya hile ara...',
          hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = filter == _selectedFilter;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              backgroundColor: AppColors.surfaceDark,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.05),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularGames() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Öne Çıkan Oyunlar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  debugPrint('View all games');
                },
                child: const Text(
                  'TÜMÜNÜ GÖR',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: mockPopularGames.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: PopularGameCard(
                  game: mockPopularGames[index],
                  onTap: () {
                    debugPrint('Game tapped: ${mockPopularGames[index].name}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAIPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6b21a8), Color(0xFF4c1d95)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hileyi bulamadın mı?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Yapay zeka asistanımız senin için bulsun.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple.shade200,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.smart_toy,
              color: AppColors.primary,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheatsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Son Eklenenler',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
        }

        final cheatIndex = index - 1;
        if (cheatIndex >= mockCheats.length) return null;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CheatCardWidget(cheat: mockCheats[cheatIndex]),
        );
      }, childCount: mockCheats.length + 1),
    );
  }
}
