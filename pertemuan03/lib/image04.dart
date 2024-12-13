import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            buildImageCard(
                'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/jakartaakurat/2023/07/film-kartun.jpeg'),
            buildImageCard(
                'https://images.tokopedia.net/img/JFrBQq/2022/9/16/b9f1881c-9fd5-4690-88e4-1d70b5c8709a.jpg'),
            buildImageCard(
                'https://s2.bukalapak.com/bukalapak-kontenz-production/content_attachments/30942/original/kartun_terbaik_1.jpg'),
            buildImageCard(
                'https://cdn.sortiraparis.com/images/1001/98390/912252-elementaire-le-film-d-animation-disney-pixar-presente-en-avant-premiere-mondiale-a-cannes.jpg'),
            buildImageCard(
                'https://images.tokopedia.net/img/KRMmCm/2022/9/16/e25d17ba-853e-4411-8a0d-67f31c159c31.jpg'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menggambar kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // Lebar penuh
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(child: const Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
