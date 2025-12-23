import '../models/news_category.dart';
import '../models/news_item.dart';

/// Mock data provider for news items.
///
/// In a real application, this would be replaced with an API service.
/// Uses const constructors where possible for performance.
abstract final class MockNewsData {
  const MockNewsData._();

  /// Returns the featured news item.
  static NewsItem get featuredNews => NewsItem(
    id: '1',
    title: 'PUBG Mobile 3.0: Kış Haritası Yayında',
    description:
        'Devasa güncelleme ile gelen yeni özellikleri, buzlu bölgeleri ve gizli ganimet noktalarını keşfetmeye hazır mısın?',
    imageUrl:
        'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=800&q=80',
    category: const NewsCategoryNews(),
    publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
    isFeatured: true,
  );

  /// Returns list of recent news items.
  static List<NewsItem> get recentNews => [
    NewsItem(
      id: '2',
      title: 'CoC: En İyi TH12 Savaş Düzeni ve Stratejileri',
      description: 'Town Hall 12 için en etkili savunma düzenleri',
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400&q=80',
      category: const NewsCategoryTips(),
      publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
      viewCount: 1200,
    ),
    NewsItem(
      id: '3',
      title: 'Brawl Stars: Yeni Efsanevi Karakter \'Draco\' Sızdırıldı!',
      description: 'Yaklaşan güncellemede gelecek yeni karakterin detayları',
      imageUrl:
          'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&q=80',
      category: const NewsCategoryNews(),
      publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
      commentCount: 45,
    ),
    NewsItem(
      id: '4',
      title: 'Wild Rift Şampiyonluk Turnuvası Kayıtları Başladı',
      description: 'Büyük ödül havuzlu turnuvaya katılın',
      imageUrl:
          'https://images.unsplash.com/photo-1560253023-3ec5d502959f?w=400&q=80',
      category: const NewsCategoryEvent(),
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NewsItem(
      id: '5',
      title: 'Hangi telefon oyun için daha iyi? FPS test sonuçları.',
      description: 'Popüler telefonların performans karşılaştırması',
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&q=80',
      category: const NewsCategoryQA(),
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
      likeCount: 89,
    ),
  ];
}
