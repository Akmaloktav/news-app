class EventModel {
  final String title;
  final String location;
  final String date;
  final String description;
  final String imageAsset;
  final String category;
  bool isRecommended;

  EventModel({
    required this.title,
    required this.location,
    required this.date,
    required this.description,
    required this.imageAsset,
    required this.category,
    this.isRecommended = false,
  });
}

final eventsList = [
  EventModel(
    title: "Blackpink World Tour JAKARTA",
    location: "Gelora Bung Karno Main Stadium",
    date: "11 - 12 Maret 2023, 18 : 30",
    description:
        "Grup K-pop legendaris, BLACKPINK akan datang ke Jakarta untuk mempromosikan album terbaru mereka, BORN PINK melalui tur dunia mereka yang bertajuk, BLACKPINK WORLD TOUR [BORN PINK] JAKARTA. Grup beranggotakan empat orang ini akan menyapa BLINK Indonesia selama dua hari! Jadi, BLINKS, persiapkan dirimu untuk menari dan menyanyi bersama lagu-lagu hits mereka mulai dari Pink Venom, DDU-DU DDU-DU, Shut Down, BOOMBAYAH, dan masih banyak lagi!",
    imageAsset:
        "https://storage.jakarta-tourism.go.id/public/events/MGrE01kRVYMgmdbkTHbYQfIJCAK75B-metaYmxhY2twaW5rLndlYnA=-.webp",
    category: "Music",
    isRecommended: true,
  ),
  EventModel(
    title: "Jakarta Esport: New Heights",
    location: "Jakarta, Jakarta Pusat",
    date: "13 Desember 2025, 09:30 - end",
    description:
        "Aksi, adrenalin, dan semua hal tentang esports—semua ada di sini! Yuk gabung di Jakarta Esports: New Heights, perayaan perdana yang mempertemukan komunitas gaming, kompetisi seru, dan kolaborasi kreatif dalam ekosistem esports Jakarta.",
    imageAsset:
        "https://storage.jakarta-tourism.go.id/public/events/xrjO90qSCcF7aD1jsEKRzr1YHsuXPg-metaQWRzXzMwMHgyNTAgcHgtMTAwLmpwZw==-.jpg",
    category: "Sport",
    isRecommended: true,
  ),
  EventModel(
    title:
        "Pameran Salihara: Salihara x Artsociates Imba: Dari Abstraksi ke Abstrakisme",
    location: "Galeri Salihara",
    date: "16 January 2026, 18.00",
    description:
        "Pameran ini menelusuri perkembangan formalisme dan abstraksi dalam seni lukis dan patung di Indonesia melalui lebih dari 80 karya dari 1950-an hingga 2025. Menghadirkan dialog lintas generasi dari A.D. Pirous, G. Sidharta, Umi Dachlan, Fadjar Sidik, hingga Amrizal Salayan, Galih Adika Paripurna, dan Mujahidin Nurrachman dan dikurasi oleh Asikin Hasan dari koleksi Artsociates. Pameran ini memperlihatkan bagaimana bentuk, imaji, dan pengalaman personal seniman meretas batas representasi, menjadikan abstraksi sebagai bahasa yang terus cair dan berkembang lintas tempat, zaman, dan latar pendidikan.",
    imageAsset:
        "https://storage.jakarta-tourism.go.id/public/events/aJmlXFM3DoGn21s86BwhbKxCFQZDQm-metaU2FsaWhhcmEgMjAyNS1FcG9zdGVyIFBhbWVyYW4gQXJ0U29jaWF0ZXMtSW1iYSBEYXJpIEFic3RyYWtzaS0yYS5qcGc=-.jpg",
    category: "Art",
  ),
  EventModel(
    title: "Jakarta Lebaran Fair",
    location: "JIEXPO Kemayoran",
    date: "19 Maret - 6 April 2026",
    description:
        "Yuk rasakan keajaiban Bulan Ramadan dan Lebaran di Jakarta Lebaran Fair 2025! Kali ini akan hadir lebih meriah, lebih besar, lebih lengkap dengan nuansa 'Seribu Satu Malam'. Jangan sampai kamu skip, ajak keluarga dan orang-orang terdekat buat rayain kebersamaan bareng-bareng ke sini!.",
    imageAsset:
        "https://storage.jakarta-tourism.go.id/public/events/cBiP4lrEA8efSUE84QFTT3r4PWsELr-metaU2NyZWVuc2hvdCAyMDI1LTAzLTAzIDEzMTg0MS5wbmc=-.png",
    category: "religion",
    isRecommended: true
  ),
];

final findRecommended = eventsList
    .where((event) => event.isRecommended == true)
    .toList();
