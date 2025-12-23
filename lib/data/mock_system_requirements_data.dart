import '../models/system_requirement.dart';

/// Mock system requirements data.
final pubgSystemRequirements = SystemRequirement(
  gameTitle: 'PUBG Mobile',
  version: 'v3.1.0',
  category: 'Battle Royale',
  rating: 4.8,
  reviewCount: '2M+ Yorum',
  iconUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuANfSxhOYwSqPkGBB4rnPpqvD8jFFLYSQmMund96riaGspv1NISv0ZFmnWAs6kTX_Y-vYcp8rBQbBId-VjXShOfWx-Ty8xhqZjNJ6Acg7x28fKe-9Ke1PUTLKak19HRY1BBiV8QLqiLXa9ZJj1DjtqcP8cTHCp7mIb12IOoNPQRosZ6uc_dHgFAoDC4Io7aGCBuPmJktyLh0JUBEjtyLFfCtG_H6j5vG7BGSSkqf_2DUdcOXLOexS-cQi6YhtXlTiC3iYTy8p0tkRpG',
  deviceInfo: const DeviceInfo(
    deviceModel: 'iPhone 13 Pro',
    meetsRecommended: true,
    compatibilityMessage: 'Harika! Cihazınız önerilen özellikleri karşılıyor.',
  ),
  minimumSpecs: const [
    SpecItem(
      label: 'İşletim Sistemi',
      value: 'Android 8+',
      subtitle: 'veya iOS 12.0+',
      icon: 'android',
      color: 'blue',
    ),
    SpecItem(
      label: 'İşlemci',
      value: 'Snapdragon 660',
      subtitle: 'veya A10 Fusion',
      icon: 'memory',
      color: 'purple',
    ),
    SpecItem(
      label: 'RAM',
      value: '4 GB',
      icon: 'developer_board',
      color: 'orange',
    ),
    SpecItem(
      label: 'Depolama',
      value: '3 GB',
      subtitle: 'BOŞ ALAN',
      icon: 'hard_drive',
      color: 'pink',
    ),
    SpecItem(
      label: 'Grafik Kartı (GPU)',
      value: 'Adreno 512 / Apple GPU (3-core)',
      subtitle: 'OpenGL ES 3.0+ veya Metal desteği',
      icon: 'sports_esports',
      color: 'teal',
    ),
  ],
  recommendedSpecs: const [
    SpecItem(
      label: 'İşletim Sistemi',
      value: 'Android 10+',
      subtitle: 'veya iOS 14.0+',
      icon: 'android',
      color: 'blue',
    ),
    SpecItem(
      label: 'İşlemci',
      value: 'Snapdragon 865',
      subtitle: 'veya A13 Bionic',
      icon: 'memory',
      color: 'purple',
    ),
    SpecItem(
      label: 'RAM',
      value: '8 GB',
      icon: 'developer_board',
      color: 'orange',
    ),
    SpecItem(
      label: 'Depolama',
      value: '6 GB',
      subtitle: 'BOŞ ALAN',
      icon: 'hard_drive',
      color: 'pink',
    ),
    SpecItem(
      label: 'Grafik Kartı (GPU)',
      value: 'Adreno 650 / Apple GPU (4-core)',
      subtitle: 'OpenGL ES 3.1+ veya Metal desteği',
      icon: 'sports_esports',
      color: 'teal',
    ),
  ],
  performanceDemand: 85,
  performanceLevel: 'Yüksek',
  performanceWarning: 'Uzun süreli oyunda cihaz ısınabilir.',
  internetRequirement: 'Kesintisiz, kararlı internet bağlantısı gerektirir.',
);
