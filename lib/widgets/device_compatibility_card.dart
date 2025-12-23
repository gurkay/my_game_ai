import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/system_requirement.dart';

/// Widget displaying user's device compatibility status.
///
/// Shows device model and whether it meets the requirements.
class DeviceCompatibilityCard extends StatelessWidget {
  /// Device information to display.
  final DeviceInfo deviceInfo;

  const DeviceCompatibilityCard({required this.deviceInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Stack(
        children: [
          // Background icon
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.smartphone, size: 80, color: Colors.white),
            ),
          ),
          // Content
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: deviceInfo.meetsRecommended
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  deviceInfo.meetsRecommended
                      ? Icons.check_circle
                      : Icons.warning_rounded,
                  color: deviceInfo.meetsRecommended
                      ? Colors.green
                      : Colors.orange,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sizin Cihazınız',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textTertiary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      deviceInfo.deviceModel,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      deviceInfo.compatibilityMessage,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: deviceInfo.meetsRecommended
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
