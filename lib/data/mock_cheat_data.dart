import '../models/cheat_item.dart';

/// Mock popular games for carousel.
final List<PopularGame> mockPopularGames = [
  const PopularGame(
    name: 'PUBG Mobile',
    displayName: 'PUBG M',
    iconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCGMI9G-pC1Ws1YNIVxf6CRpAki6TSTvzDTK_YyYm1paUxlXMQKm6ngzMvVN7O3LUUpG8z2hGgQY_fY28P4Iq3vXTenVNg8b-YJKBFLvJJdUCHG92L1RHA7lqcfNrsRt2HusVfFx-TIYqLkw4FP47aaEHyyJC-B53HkYjxkd6oX4eXXERfaAgAhVEB494QpktOK4vAkrqXEkj39KEN85zeWlkhj8Z9De69rUQfFQ7VmW2JgL6smiAXUqX9CLT_dcmVl2qemN6DX6Oip',
    isFeatured: true,
  ),
  const PopularGame(
    name: 'Roblox',
    displayName: 'Roblox',
    iconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBvmqaYTkES7_rQg5KVUaGFcv56BajkdvscstwSWlrqMqNi8UwTFz1R5ZQ0Nva1el9hReuFEclt_DTxmxE4oBQ7FpKpw9EzmpSCKFzr8dRsuSeY4rGCB49ua-8lVQQkQedu4Tzv0TdbmOnW420RcTYmTafpVlRYXLd7hpfA0iubtl6M_SttI9AC_Zo_CZ2XU2aDhW8E-UTTbkPwg2I5quG3FynNV4LyfJ9GDKHPrbyTQOIZDF9oIWZUpr7pZpYwn2i7cc82NzLIe7_g',
  ),
  const PopularGame(
    name: 'Clash of Clans',
    displayName: 'Clash',
    iconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAATc1rqySA571v8ikAifudLsUSe1r_zPRAYITiDwv0T8c61fGcK4WBjIALMNB0RIROLVnq9jlpdbJgVoA_Ua8Q97L6LFA7TBWpWK-DHbOw5ZXikhp7Cj8ZfgA_l30gE6byvwkOjxPZen-4s-GA7uk3_LpYrY-09_7wPXwEl6DHVDCemR5MIAi8VrgHiFB_2l23qUC6r_eGCwexe88fJf_Jh2merICxxKcknIzGPoavJyIqC48hKbPwxDGyzFMb4sz53GmS_W8bJTFV',
  ),
  const PopularGame(
    name: 'Minecraft',
    displayName: 'Minecraft',
    iconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDYZm1AR3VKuyvoiRhO2fvUh4OPIs9d1eTShv4pNaR-Npu8xMeWZ8UhLDHmAfVr-wp6mZepQfMb6un6cfWsqV_QFzC6ucvE9BHEWACgShrtmgwlsB92s3S7R3SP7XlWlYjU7rUpShgCSrvx5ADcHteae3PWmseJoPaXlMaRUjuc_AuB_JC9P5QK75JBaRxVAEAsAWT8W2KvQ_nYE6r7f0uKBos8AnFArCs9oUmd9ICM1MIp0oppFOLysaAw3EYeoS6NzyXLhMdoQjKX',
  ),
  const PopularGame(
    name: 'Diğer Oyunlar',
    displayName: 'Diğer',
    iconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCyS8vj-VHptbi_rSnwB4JQwGh5LtejWxIaDtWq9isNVIx8yJYIIDn6Dnzizz7-TY_O0kWqxG35WRNtOcVZqawD03FVkeB8txqBCzKewYvDetWPAMX_vdbQ2Z9TAHmdbTMN8it5yLDliFL5JxUIa99ivNBtSwQoDlYKXzVVGin1EEdBbrjy7pCRX3CT92JX2Gxg9xer28Jj18IQqu6Amu5qY5DJ4he-z49WHg6ZPe2IyP-ie5dJu-HIOzSPDHtNyJLhUNAxv_1DN_C0',
  ),
];

/// Mock cheat items.
final List<CheatItem> mockCheats = [
  const CheatItem(
    gameName: 'GTA V',
    gameIconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDzdQuWWWuoafETL43RzdsiUk5up-oLHGFCew0JH_hTghAGWf20xW-GpblUe_o4oWUjO9mrTKen-pUp8Y78hcVAOnKAt0xtmK85P04_lDfl3OBmK-uKWAmct6BJPZ0LZzHVHY5tkl4tYBaWqnV9CGuKpB00jnJdnihAcvwfsab8Rrfl0yqXk58T7lmkvubnBPjnBGq2wIoyvUmS1Zw8LUa3L794wOThOu8Tk_J821F5XXWIVDqCi10bfpse5U31aenalunlH613y0ke',
    title: 'Ölümsüzlük Modu (5 Dakika)',
    type: CodeCheat('PlayStation'),
    status: WorkingStatus(),
    code: 'RIGHT, X, RIGHT, LEFT, RIGHT, R1',
  ),
  const CheatItem(
    gameName: 'Minecraft',
    gameIconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDfYKGz9UTW6O1Jz38oa3MsKknD7_TSHCHx5QTl8Nju1bIN8oiyF215oLG-6cfs3nMQsOqEBLyTD797iC_W5mr0vAFDn_x4kZ-Uwg8ORk0D8tiuU8btOe8LJvN5R3w6AKU6eCa2nFqjAWDIz-pOEh49MwNrk7hjC0ZQmHKjMWOy9vfX_lNoskEL0Nlcp7cO5vlmeyIusHqsKg_x9YyKlUDundH_LiMqefwNhmPItofyp4K0hvFxR1lMLIu9obytBcliqL7eh9rXhTYT',
    title: '64 Adet Elmas Alma Kodu',
    type: CommandCheat('PC/Mobil'),
    status: PlatformStatus('PC/Mobil'),
    code: '/give @p diamond 64',
  ),
  const CheatItem(
    gameName: 'Valorant',
    gameIconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuD58p2j0RSsX2mnep9a4bZ6aQmBR2dmhW9OhSx_S57ogXpAN519MVLGQyepftQL88kA_aYxtgQdpAR3CLcoAxpWEIrT6FLSa5PJ15oDejV4FVnHAF9BFaxqk1nn88ZpkfUt5cJSyGZAhAm89XmyLL5oanAmkfqGqvD6w_jxNMWKwBP6Vm2val7zDVafSKvMoSp1qBzCLB5hhIxG5zRw-c0iWQTEydCIPaC5SHf8a2mJbVbfmem8lgoh4dEbDYATLIsaaIEsren8nvbt',
    title: 'Sova Lineups - Ascent Haritası',
    type: GuideCheat(),
    status: GuideStatus(),
    description:
        'Ascent B bölgesine saldırırken kullanabileceğiniz en etkili 3 görüş oku taktiği. Garaj bölgesinden atılan...',
  ),
  const CheatItem(
    gameName: 'Clash of Clans',
    gameIconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDfd-mp42-byH8WAiPwJHb7wiTLKtvMcUnAw1gFDbNlgT8fe4NyHZ5cfjDOf8LfbplyOdguZa1hSqeyYq-I7yOj6gcafFbu22n5nFyNpU6W0Uj6TMpt-sQdX6rZj93UZbRJXGXFKoNGyQdE8CPiOr2pJxxM4qOuxBAbMP3B_4GFyI4IYybKezpY-vVbv1V9eO00o5UCHvtdFhq_tv7c_xfpK4qg7JGY2eTXvQdYL85gpxpZ-PP6P5vWkt9GB0O763wwniw1bzZjB7Aq',
    title: 'Belediye Binası 10 Saldırı Taktiği',
    type: StrategyCheat(),
    status: TacticStatus(),
    description:
        'Ejderha ve Balon kombinasyonu ile 3 yıldız almak için ordunuzu nasıl konuşlandırmanız gerektiği hakkında detaylı...',
  ),
  const CheatItem(
    gameName: 'GTA V',
    gameIconUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDzdQuWWWuoafETL43RzdsiUk5up-oLHGFCew0JH_hTghAGWf20xW-GpblUe_o4oWUjO9mrTKen-pUp8Y78hcVAOnKAt0xtmK85P04_lDfl3OBmK-uKWAmct6BJPZ0LZzHVHY5tkl4tYBaWqnV9CGuKpB00jnJdnihAcvwfsab8Rrfl0yqXk58T7lmkvubnBPjnBGq2wIoyvUmS1Zw8LUa3L794wOThOu8Tk_J821F5XXWIVDqCi10bfpse5U31aenalunlH613y0ke',
    title: 'Tüm Silahlar Kodu',
    type: CodeCheat('Xbox'),
    status: WorkingStatus(),
    code: 'Y, RT, LEFT, LB, A, RIGHT, Y, DOWN',
  ),
];
