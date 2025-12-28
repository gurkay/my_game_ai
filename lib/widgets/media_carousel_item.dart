import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/game.dart';

/// A widget displaying a media item in the game gallery carousel.
///
/// Supports both video and image types with appropriate indicators.
class MediaCarouselItem extends StatelessWidget {
  const MediaCarouselItem({
    required this.mediaItem,
    required this.onTap,
    super.key,
  });

  /// The media item to display.
  final MediaItem mediaItem;

  /// Callback when the item is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isVideo = mediaItem is VideoMediaItem;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 112,
        child: Column(
          children: [
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    // Thumbnail image
                    Positioned.fill(
                      child: Image.network(
                        mediaItem.thumbnailUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.textTertiary.withOpacity(0.1),
                          child: const Icon(
                            Icons.image_outlined,
                            size: 32,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                    ),
                    // Video play indicator overlay
                    if (isVideo)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black26,
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              mediaItem.label,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textLight.withOpacity(0.7)
                    : AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
