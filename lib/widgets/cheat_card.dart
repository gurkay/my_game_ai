import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme/app_colors.dart';
import '../models/game.dart';

/// A widget displaying a cheat or tip for the game.
///
/// Can be expanded to show details and code snippets.
class CheatCard extends StatefulWidget {
  const CheatCard({
    required this.cheat,
    this.initiallyExpanded = false,
    super.key,
  });

  /// The cheat to display.
  final Cheat cheat;

  /// Whether the card starts in expanded state.
  final bool initiallyExpanded;

  @override
  State<CheatCard> createState() => _CheatCardState();
}

class _CheatCardState extends State<CheatCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF231730) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isExpanded
              ? AppColors.primary.withOpacity(0.3)
              : (isDark
                    ? Colors.white.withOpacity(0.05)
                    : Colors.grey.shade200),
        ),
        boxShadow: _isExpanded
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _getIconColor().withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getIconData(),
                      size: 16,
                      color: _getIconColor(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cheat.title,
                          style: TextStyle(
                            color: isDark
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.cheat.subtitle,
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expand icon
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: _isExpanded
                        ? AppColors.primary
                        : AppColors.textTertiary,
                  ),
                ],
              ),
            ),
          ),
          // Expanded content
          if (_isExpanded) _buildExpandedContent(isDark),
        ],
      ),
    );
  }

  Widget _buildExpandedContent(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1023) : AppColors.backgroundLight,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.cheat.description,
            style: TextStyle(
              color: isDark
                  ? AppColors.textLight.withOpacity(0.8)
                  : AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          if (widget.cheat.code != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.cheat.code!,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: widget.cheat.code!),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Kod kopyalandı'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.copy,
                          size: 14,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Kopyala',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.textLight.withOpacity(0.7)
                                : AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getIconData() {
    switch (widget.cheat.icon) {
      case 'vpn_key':
        return Icons.vpn_key;
      case 'attach_money':
        return Icons.attach_money;
      default:
        return Icons.info_outline;
    }
  }

  Color _getIconColor() {
    switch (widget.cheat.icon) {
      case 'vpn_key':
        return AppColors.primary;
      case 'attach_money':
        return AppColors.success;
      default:
        return AppColors.info;
    }
  }
}
