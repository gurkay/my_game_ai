import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/system_requirement.dart';

/// Widget displaying a single specification item card.
///
/// Shows spec icon, label, value, and optional subtitle in a card format.
class SpecCard extends StatelessWidget {
  /// The specification item to display.
  final SpecItem spec;

  /// Whether to display in full width (col-span-2).
  final bool fullWidth;

  const SpecCard({required this.spec, this.fullWidth = false, super.key});

  Color _getColorFromString(String colorName) {
    switch (colorName) {
      case 'blue':
        return Colors.blue;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      case 'teal':
        return Colors.teal;
      default:
        return AppColors.primary;
    }
  }

  IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'android':
        return Icons.android;
      case 'memory':
        return Icons.memory;
      case 'developer_board':
        return Icons.developer_board;
      case 'hard_drive':
        return Icons.storage;
      case 'sports_esports':
        return Icons.sports_esports;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColorFromString(spec.color);
    final icon = _getIconFromString(spec.icon);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: fullWidth
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spec.label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textTertiary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        spec.value,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (spec.subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          spec.subtitle!,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textTertiary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: color, size: 18),
                    ),
                    Flexible(
                      child: Text(
                        spec.label,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  spec.value,
                  style: TextStyle(
                    fontSize: spec.subtitle != null ? 13 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (spec.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    spec.subtitle!,
                    style: TextStyle(
                      fontSize: 9,
                      color: AppColors.textTertiary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
    );
  }
}
