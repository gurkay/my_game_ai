import '../models/forum_question.dart';

/// Mock forum questions data.
final List<ForumQuestion> mockForumQuestions = [
  const ForumQuestion(
    title: "Clash Royale'de şu anki meta için en iyi deste hangisi?",
    body:
        "Arena 15'te takılı kaldım. Özellikle Binici veya Elit Barbar destesi önerisi olan var mı? Karşıma sürekli Mega Şövalye çıkıyor.",
    author: ForumAuthor(
      username: 'AhmetK',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC4BMLOz4RCI7XnlSaAx-59VkTDlYKuTZ0D1C-wb8xbvMbFUkjH769YW3kTnoFWEoTX7xV2F53JJzwjBDbVszC32eUba8ZybJU_f9BVksoPNxNtvpfrTadqTXsAgAhO_KusKWShrQ1Yd-RP01klpVjDDvaOuH4zdTrvp9HBZcNKoE-sbZu3Q_lBmUHj1ycwwn7cEygcmQSzBwubo_wS8LZF5o3mOnwFBhgc_kBe8r1AF0-lXJgB3cfOfAZM-mxSD4lIfRdQBtdsfQxi',
      timeAgo: '2 saat önce',
    ),
    category: StrategyCat(),
    status: SolvedStatus(),
    commentCount: 12,
    likeCount: 45,
  ),
  const ForumQuestion(
    title: 'PUBG Mobile yeni güncelleme hatası',
    body:
        "Oyunu güncelledikten sonra lobiye girerken siyah ekranda kalıyor, ses var ama görüntü yok. Çözümünü bilen var mı?",
    author: ForumAuthor(
      username: 'GamerGirl99',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCu6EGoH6-vgxH9RheQaf2bjNnyCNUYsBmnu7QtzzAlMVV0fH1VYvfoJysqYEIXGhwwqR-iuUzQ-nUMyVhp88eiT8ZvZ5cra73oZPrO783mV3OGosxPyPtIQN84UpYU8w0OFPR3Wo4vAYd9lBBYVwiJZ1RELgkpQTqDYlF1qo0nJCE-_xZhOIAf8jwgAeuGsnLa0jDBuqG7lrwDDQdamutRne7qe4BRkpNRLp6YSV6Djd3ddFPVbWr9oxCFn-kRNyn9uO9aYWICdQAN',
      timeAgo: '15 dk önce',
    ),
    category: BattleRoyaleCat(),
    status: UnansweredStatus(),
    commentCount: 0,
    likeCount: 2,
    isHighlighted: true,
  ),
  const ForumQuestion(
    title: 'Wild Rift: Yeni şampiyon ne zaman geliyor?',
    body:
        'Riot son yama notlarında bir ipucu vermişti ama kesin tarih belli mi?',
    author: ForumAuthor(
      username: 'TeknoCan',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBGHYphAr5AEqjvwgX41dMwSLKtdwhAOH6JM5LD2sT0UhxuMIVTM2BSmEna7JNxkQnYh1LJSVHGdgZnkKMDT_kSVtcZ8PooDRGSbfIWFZDeFRCCLnNNxAePB5xSaL1dHHQfIUy2geYqqIYgrY8K0fjnj_tV5-RdKUTn6ntCgIyOQjSHbShfZxSBJunExy5QqrVZEXEHhueSMmjPvNCbpnXBNkvWRuR2QttYMS5AKFk6mZ6oGoVKojLT_KJiOKAj8ybkuGg6bvsT6nL1',
      timeAgo: '5 saat önce',
    ),
    category: MobaCat(),
    status: ActiveStatus(),
    commentCount: 8,
    likeCount: 21,
  ),
  const ForumQuestion(
    title: 'Genshin Impact 60 FPS ayarları',
    body:
        "iPhone 13'te ısınma yapmadan 60 FPS oynamak mümkün mü? Hangi grafik ayarlarını kısmalıyım?",
    author: ForumAuthor(
      username: 'SpeedRacer',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDjix-8biY58IcKHh4iJO4G52gFvg0KdC-WT8dDSRzlUr3RszGZ3LUCLWp1M6V0qPCDbsskCXljM4gzOYWxYTtHRdTBN_jmVJHVOw-QupyLDHywI-dRMRB2reJqWWZ1tUMNK4F2kPTxlVTc_BMj5Dwt5NGlsB-kP2qjwZuFRHeNylPYd4Xtg11B4psUm6OD7PzmeKzkwZeY84aK6In0X4UrvXOdB4tR20eqTp3C2FwONVycRgSMOpWiPqc1m83vzJulwUHmx7G0xQ__',
      timeAgo: '1 gün önce',
    ),
    category: RpgCat(),
    status: ActiveStatus(),
    commentCount: 34,
    likeCount: 156,
  ),
  const ForumQuestion(
    title: 'Call of Duty Mobile kontrol ayarları',
    body: 'Claw yöntemi mi yoksa 2 parmak mı daha iyi? Öneriniz nedir?',
    author: ForumAuthor(
      username: 'ProGamer',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCzO0AR_cGLp6bs0qaYjBZ6szitjDZtrbALleYo6_FxHYGwEggip-6Ns4tOl7lfFTDqJ3baZdJRY02PBRTEazchF4b7n64ujdeQB5jkmAmyaQ6zZ3embdRyy2l6pqGb_6yPiZyF1huWz6YdDMOPeyi7sXfWs3RpgYeGg13HVsjJimKqKNa-iOIhyVQzfeoG4kx230qIjTf9ZUqO9NhUUeCojoK_WQNNf68wr_qFLmp7HhQE9u8m1gTcRXQqxOwkR4GSymv43J4alXj6',
      timeAgo: '3 saat önce',
    ),
    category: FpsCat(),
    status: ActiveStatus(),
    commentCount: 18,
    likeCount: 67,
  ),
];

/// Available forum categories for filtering.
const List<ForumCategory> forumCategories = [
  StrategyCat(),
  BattleRoyaleCat(),
  MobaCat(),
  RpgCat(),
  FpsCat(),
];
