import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme/app_colors.dart';
import '../models/cheat_item.dart';
import '../data/mock_cheat_detail_data.dart';
import '../pages/cheat_detail_page.dart';

/// Widget displaying a single cheat card.
///
/// Shows game info, cheat title, and interactive code/command copy or
/// guide/strategy preview.
class CheatCardWidget extends StatelessWidget {
  /// The cheat item to display.
  final CheatItem cheat;

  const CheatCardWidget({required this.cheat, super.key});

  Color _getStatusColor() {
    switch (cheat.status.color) {
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'orange':
        return Colors.orange;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final detail = cheatDetailsMap[cheat.title];
        if (detail != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheatDetailPage(detail: detail),
            ),
          );
        } else {
          debugPrint('No detail found for: ${cheat.title}');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withAlpha(13)),
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
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Game icon
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            cheat.gameIconUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        // Game and cheat info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      cheat.gameName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Status badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withAlpha(26),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      cheat.status.text.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                cheat.title,
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (cheat.type) {
      case CodeCheat _:
      case CommandCheat _:
        return _buildCodeContent(context);
      case GuideCheat _:
      case StrategyCheat _:
        return _buildGuideContent();
    }
  }

  Widget _buildCodeContent(BuildContext context) {
    if (cheat.code == null) return const SizedBox();

    final platformLabel = switch (cheat.type) {
      CodeCheat(platform: final p) => p,
      CommandCheat(platform: final p) => p,
      _ => '',
    };

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: cheat.code!));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Kod kopyalandı!'),
            duration: const Duration(seconds: 2),
            backgroundColor: AppColors.primary,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withAlpha(13)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platformLabel.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    cheat.code!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      fontFamily: 'monospace',
                      letterSpacing: 0.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.content_copy, size: 20, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideContent() {
    if (cheat.description == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cheat.description!,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              debugPrint('View guide: ${cheat.title}');
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              side: BorderSide(
                color: cheat.type is GuideCheat
                    ? AppColors.primary.withAlpha(77)
                    : Colors.white12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cheat.type is GuideCheat ? 'Rehberi Oku' : 'Devamını Gör',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: cheat.type is GuideCheat
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
                if (cheat.type is GuideCheat) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
