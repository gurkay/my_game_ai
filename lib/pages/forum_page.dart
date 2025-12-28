import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/mock_forum_data.dart';
import '../models/forum_question.dart';
import '../widgets/question_card.dart';

/// Forum Q&A page with search, filters, and question feed.
///
/// Displays community questions with categories, status badges,
/// and interaction metrics.
class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  String _selectedFilter = 'Tümü';
  final List<String> _filters = [
    'Tümü',
    'Popüler',
    'FPS',
    'RPG',
    'MOBA',
    'Strateji',
  ];

  List<ForumQuestion> get _filteredQuestions {
    if (_selectedFilter == 'Tümü' || _selectedFilter == 'Popüler') {
      return mockForumQuestions;
    }
    return mockForumQuestions.where((q) {
      return q.category.name == _selectedFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          _buildHeader(),
          SliverToBoxAdapter(child: _buildSearchBar()),
          SliverToBoxAdapter(child: _buildFilterChips()),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: _buildQuestionsList(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundDark.withOpacity(0.9),
      pinned: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCzO0AR_cGLp6bs0qaYjBZ6szitjDZtrbALleYo6_FxHYGwEggip-6Ns4tOl7lfFTDqJ3baZdJRY02PBRTEazchF4b7n64ujdeQB5jkmAmyaQ6zZ3embdRyy2l6pqGb_6yPiZyF1huWz6YdDMOPeyi7sXfWs3RpgYeGg13HVsjJimKqKNa-iOIhyVQzfeoG4kx230qIjTf9ZUqO9NhUUeCojoK_WQNNf68wr_qFLmp7HhQE9u8m1gTcRXQqxOwkR4GSymv43J4alXj6',
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Soru & Cevap',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Topluluk Forumu',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {
            debugPrint('Notifications tapped');
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
          hintText: 'Sorularda, oyunlarda veya konularda ara...',
          hintStyle: TextStyle(color: AppColors.textTertiary, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: AppColors.textTertiary),
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
                color: isSelected ? Colors.white : AppColors.textTertiary,
              ),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.05),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuestionsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: QuestionCard(
            question: _filteredQuestions[index],
            onTap: () {
              debugPrint('Question tapped: ${_filteredQuestions[index].title}');
            },
          ),
        );
      }, childCount: _filteredQuestions.length),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        debugPrint('Add question tapped');
      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, size: 32, color: Colors.white),
    );
  }
}
