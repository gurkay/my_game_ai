import '../models/cheat_detail.dart';
import '../models/cheat_item.dart';

/// Mock cheat detail for GTA V immortality cheat.
final gtaImmortalityDetail = CheatDetail(
  cheat: const CheatItem(
    gameName: 'GTA V',
    gameIconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDzdQuWWWuoafETL43RzdsiUk5up-oLHGFCew0JH_hTghAGWf20xW-GpblUe_o4oWUjO9mrTKen-pUp8Y78hcVAOnKAt0xtmK85P04_lDfl3OBmK-uKWAmct6BJPZ0LZzHVHY5tkl4tYBaWqnV9CGuKpB00jnJdnihAcvwfsab8Rrfl0yqXk58T7lmkvubnBPjnBGq2wIoyvUmS1Zw8LUa3L794wOThOu8Tk_J821F5XXWIVDqCi10bfpse5U31aenalunlH613y0ke',
    title: 'Ölümsüzlük Modu',
    type: CodeCheat('PlayStation'),
    status: WorkingStatus(),
    code: 'RIGHT, X, RIGHT, LEFT, RIGHT, R1, RIGHT, LEFT, X, TRIANGLE',
  ),
  description:
      'Bu hile kodu karakterinize 5 dakika boyunca tam ölümsüzlük sağlar. Mermiler, patlamalar, düşmeler ve araç çarpmaları karakterinize zarar vermez.',
  warning:
      'Bu hile aktifken başarımlar (trophies/achievements) devre dışı bırakılır. Oyunu kaydetmeden önce hileyi kullandığınızdan emin olun.',
  steps: const [
    CheatStep(
      number: 1,
      title: 'Oyuna Girin',
      description:
          'GTA V oyununu açın ve Story Mode (Hikaye Modu) içerisine girin.',
    ),
    CheatStep(
      number: 2,
      title: 'Kodu Girin',
      description:
          'Oyun sırasında duraklatmadan yukarıdaki tuş kombinasyonunu hızlıca girin.',
    ),
    CheatStep(
      number: 3,
      title: 'Onay Mesajı',
      description:
          'Doğru girdiyseniz ekranın sol alt köşesinde "Cheat Activated" uyarısı belirecektir.',
    ),
  ],
  videoUrl: 'https://example.com/video',
  videoThumbnail:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD58p2j0RSsX2mnep9a4bZ6aQmBR2dmhW9OhSx_S57ogXpAN519MVLGQyepftQL88kA_aYxtgQdpAR3CLcoAxpWEIrT6FLSa5PJ15oDejV4FVnHAF9BFaxqk1nn88ZpkfUt5cJSyGZAhAm89XmyLL5oanAmkfqGqvD6w_jxNMWKwBP6Vm2val7zDVafSKvMoSp1qBzCLB5hhIxG5zRw-c0iWQTEydCIPaC5SHf8a2mJbVbfmem8lgoh4dEbDYATLIsaaIEsren8nvbt',
  videoDuration: '0:45',
  rating: 4.8,
  voteCount: '1.2k Oylama',
  comments: const [
    CheatComment(
      username: 'Ahmet Yılmaz',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCyS8vj-VHptbi_rSnwB4JQwGh5LtejWxIaDtWq9isNVIx8yJYIIDn6Dnzizz7-TY_O0kWqxG35WRNtOcVZqawD03FVkeB8txqBCzKewYvDetWPAMX_vdbQ2Z9TAHmdbTMN8it5yLDliFL5JxUIa99ivNBtSwQoDlYKXzVVGin1EEdBbrjy7pCRX3CT92JX2Gxg9xer28Jj18IQqu6Amu5qY5DJ4he-z49WHg6ZPe2IyP-ie5dJu-HIOzSPDHtNyJLhUNAxv_1DN_C0',
      text: 'PS4 üzerinde denedim sorunsuz çalışıyor. Teşekkürler!',
      timeAgo: '2 saat önce',
      likes: 12,
    ),
    CheatComment(
      username: 'OyunCanavarı',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBvmqaYTkES7_rQg5KVUaGFcv56BajkdvscstwSWlrqMqNi8UwTFz1R5ZQ0Nva1el9hReuFEclt_DTxmxE4oBQ7FpKpw9EzmpSCKFzr8dRsuSeY4rGCB49ua-8lVQQkQedu4Tzv0TdbmOnW420RcTYmTafpVlRYXLd7hpfA0iubtl6M_SttI9AC_Zo_CZ2XU2aDhW8E-UTTbkPwg2I5quG3FynNV4LyfJ9GDKHPrbyTQOIZDF9oIWZUpr7pZpYwn2i7cc82NzLIe7_g',
      text: 'Online modda çalışmıyor arkadaşlar denemeyin ban yiyebilirsiniz.',
      timeAgo: '1 gün önce',
      likes: 45,
    ),
  ],
);

/// Map of cheat titles to their details.
final Map<String, CheatDetail> cheatDetailsMap = {
  'Ölümsüzlük Modu': gtaImmortalityDetail,
  'Ölümsüzlük Modu (5 Dakika)': gtaImmortalityDetail,
};
