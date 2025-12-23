import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/system_requirement.dart';
import '../widgets/device_compatibility_card.dart';
import '../widgets/performance_meter.dart';
import '../widgets/spec_card.dart';

/// System requirements page showing minimum and recommended specs.
///
/// Displays device compatibility, tabs for requirement levels, specs grid,
/// and performance information.
class SystemRequirementsPage extends StatefulWidget {
  /// System requirements data.
  final SystemRequirement requirements;

  const SystemRequirementsPage({required this.requirements, super.key});

  @override
  State<SystemRequirementsPage> createState() => _SystemRequirementsPageState();
}

class _SystemRequirementsPageState extends State<SystemRequirementsPage> {
  bool _showRecommended = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(child: _buildGameHeader()),
          SliverToBoxAdapter(
            child: DeviceCompatibilityCard(
              deviceInfo: widget.requirements.deviceInfo,
            ),
          ),
          SliverToBoxAdapter(child: _buildTabControl()),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: _buildSpecsGrid(),
          ),
          SliverToBoxAdapter(
            child: PerformanceMeter(
              performanceDemand: widget.requirements.performanceDemand,
              performanceLevel: widget.requirements.performanceLevel,
              warningMessage: widget.requirements.performanceWarning,
            ),
          ),
          SliverToBoxAdapter(child: _buildInternetInfo()),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: _buildAIButton(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundDark.withOpacity(0.8),
      elevation: 0,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Sistem Gereksinimleri',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildGameHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Game icon with hover effect
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.requirements.iconUrl,
                width: 112,
                height: 112,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Game info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.requirements.gameTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        widget.requirements.version,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.requirements.category,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.requirements.rating}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${widget.requirements.reviewCount})',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabControl() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF2a2235),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              'Minimum',
              !_showRecommended,
              () => setState(() => _showRecommended = false),
            ),
          ),
          Expanded(
            child: _buildTabButton(
              'Önerilen',
              _showRecommended,
              () => setState(() => _showRecommended = true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textTertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildSpecsGrid() {
    final specs = _showRecommended
        ? widget.requirements.recommendedSpecs
        : widget.requirements.minimumSpecs;

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final spec = specs[index];
        // GPU card should be full width
        if (spec.icon == 'sports_esports') {
          return GridTile(child: SpecCard(spec: spec, fullWidth: true));
        }
        return SpecCard(spec: spec);
      }, childCount: specs.length),
    );
  }

  Widget _buildInternetInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.wifi, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                children: [
                  const TextSpan(
                    text: 'İnternet Bağlantısı: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(text: widget.requirements.internetRequirement),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              const Icon(Icons.smart_toy, color: AppColors.primary, size: 24),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI DESTEK',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                  letterSpacing: 1.2,
                ),
              ),
              const Text(
                'Bu oyunu açar mı?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
