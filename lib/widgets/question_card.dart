import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/forum_question.dart';

/// Widget displaying a single forum question card.
///
/// Shows author info, title, body preview, category, and interaction stats.
class QuestionCard extends StatelessWidget {
  /// The question to display.
  final ForumQuestion question;

  /// Callback when card is tapped.
  final VoidCallback? onTap;

  const QuestionCard({required this.question, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: question.isHighlighted
              ? Border.all(color: AppColors.primary.withOpacity(0.3), width: 1)
              : Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildBody(),
            const SizedBox(height: 12),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(question.author.avatarUrl),
        ),
        const SizedBox(width: 12),
        // Author info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.author.username,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                question.author.timeAgo,
                style: TextStyle(fontSize: 11, color: AppColors.textTertiary),
              ),
            ],
          ),
        ),
        // Status badge
        if (question.status is SolvedStatus)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withAlpha(26),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ÇÖZÜLDÜ',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                letterSpacing: 0.5,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          question.body,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildFooter() {
    final isActive = question.commentCount == 0;

    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Row(
        children: [
          // Category chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              question.category.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textTertiary,
              ),
            ),
          ),
          const Spacer(),
          // Comments
          _buildStat(
            Icons.chat_bubble_outline,
            question.commentCount,
            isHighlighted: isActive,
          ),
          const SizedBox(width: 16),
          // Likes
          _buildStat(Icons.thumb_up_outlined, question.likeCount),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, int count, {bool isHighlighted = false}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isHighlighted ? AppColors.primary : AppColors.textTertiary,
        ),
        const SizedBox(width: 6),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 12,
            fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
            color: isHighlighted ? AppColors.primary : AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
