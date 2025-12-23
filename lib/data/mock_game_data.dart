import '../models/game.dart';

/// Mock data provider for game details.
///
/// In a real application, this would be replaced with an API service.
abstract final class MockGameData {
  const MockGameData._();

  /// Returns detailed information about Cyber Legends game.
  static Game get cyberLegends => Game(
    id: 'cyber-legends',
    title: 'Cyber Legends',
    heroImageUrl:
        'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=800&q=80',
    genres: const ['RPG', 'Aksiyon'],
    version: 'v2.4.0',
    rating: 4.8,
    reviewCount: 12000,
    description:
        'Geleceğin distopik dünyasında geçen aksiyon dolu bir RPG macerası. '
        'Kendi karakterini oluştur, yeteneklerini geliştir ve siber tehditlere karşı savaş.',
    mediaItems: const [
      VideoMediaItem(
        thumbnailUrl:
            'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400&q=80',
        label: 'Oynanış',
        videoUrl: 'https://example.com/gameplay.mp4',
      ),
      ImageMediaItem(
        thumbnailUrl:
            'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&q=80',
        label: 'Karakterler',
      ),
      ImageMediaItem(
        thumbnailUrl:
            'https://images.unsplash.com/photo-1560253023-3ec5d502959f?w=400&q=80',
        label: 'Sinematik',
      ),
    ],
  );

  /// Returns list of game updates/news.
  static List<GameUpdate> get updates => [
    GameUpdate(
      id: '1',
      title:
          'Yama Notları v2.4: Yeni \'Gece Şehri\' Haritası ve Silah Dengelemeleri',
      description:
          'Bu güncelleme ile birlikte beklenen gece modu haritası oyuna ekleniyor. '
          'Ayrıca keskin nişancı tüfeklerinde önemli değişiklikler yapıldı.',
      imageUrl:
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&q=80',
      type: 'Güncelleme',
      publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    GameUpdate(
      id: '2',
      title: 'Haftasonu Çifte XP Etkinliği Başlıyor',
      description:
          'Cuma akşamından Pazar gece yarısına kadar tüm modlarda geçerli.',
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400&q=80',
      type: 'Etkinlik',
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    GameUpdate(
      id: '3',
      title: 'Planlı Sunucu Bakımı',
      description:
          'Sunucular 15 Mayıs 03:00 - 05:00 saatleri arasında kapalı olacaktır.',
      imageUrl:
          'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&q=80',
      type: 'Bakım',
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  /// Returns list of cheats and tips.
  static List<Cheat> get cheats => const [
    Cheat(
      id: '1',
      title: 'Tüm Kostümleri Aç',
      subtitle: 'Sadece offline modda çalışır',
      description:
          'Ayarlar menüsünden hesap çıkışı yapın ve offline modda oynayın.',
      code: null,
      icon: 'vpn_key',
    ),
    Cheat(
      id: '2',
      title: 'Sınırsız Para Glitch',
      subtitle: 'v2.3.0 sürümü için test edildi',
      description:
          'Mağazaya gidin ve en pahalı eşyayı seçin. '
          '"Satın Al" butonuna basarken aynı anda menü tuşuna basılı tutun.',
      code: 'UP, UP, DOWN, A, B',
      icon: 'attach_money',
    ),
  ];

  /// Returns rating statistics.
  static RatingStatistics get ratingStats => const RatingStatistics(
    averageRating: 4.8,
    totalRatings: 12000,
    fiveStarPercentage: 75,
    fourStarPercentage: 15,
    threeStarPercentage: 5,
    twoStarPercentage: 3,
    oneStarPercentage: 2,
  );
}
