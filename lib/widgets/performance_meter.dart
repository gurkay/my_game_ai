import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// Widget displaying performance demand meter with visual indicator.
///
/// Shows performance level as text and progress bar with gradient.
class PerformanceMeter extends StatelessWidget {
  /// Performance demand level (0-100).
  final int performanceDemand;

  /// Performance level text (e.g., "Yüksek").
  final String performanceLevel;

  /// Optional warning message.
  final String? warningMessage;

  const PerformanceMeter({
    required this.performanceDemand,
    required this.performanceLevel,
    this.warningMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Performans Talebi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bu oyun cihaz kaynaklarını yoğun kullanır.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              Text(
                performanceLevel,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Progress bar
          Container(
            height: 12,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: performanceDemand / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withOpacity(0.6),
                          AppColors.primary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 8,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (warningMessage != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.warning_rounded,
                  size: 16,
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    warningMessage!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
