import 'package:flutter/material.dart';

class Studikasus03 extends StatefulWidget {
  const Studikasus03({super.key});

  @override
  State<Studikasus03> createState() => _Studikasus03State();
}

class _Studikasus03State extends State<Studikasus03> {
  final List<String> KartunList = [
    'Kartun 1',
    'Kartun 2',
    'Kartun 3',
    'Kartun 4',
    'Kartun 5'
  ];
  final Map<String, String> KartunImages = {
    'Kartun 1':
        'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/jakartaakurat/2023/07/film-kartun.jpeg',
    'Kartun 2':
        'https://images.tokopedia.net/img/JFrBQq/2022/9/16/b9f1881c-9fd5-4690-88e4-1d70b5c8709a.jpg',
    'Kartun 3':
        'https://s2.bukalapak.com/bukalapak-kontenz-production/content_attachments/30942/original/kartun_terbaik_1.jpg',
    'Kartun 4':
        'https://cdn.sortiraparis.com/images/1001/98390/912252-elementaire-le-film-d-animation-disney-pixar-presente-en-avant-premiere-mondiale-a-cannes.jpg',
    'Kartun 5':
        'https://images.tokopedia.net/img/KRMmCm/2022/9/16/e25d17ba-853e-4411-8a0d-67f31c159c31.jpg',
  };

  String? selectedKartun;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Kartun'),
              value: selectedKartun,
              isExpanded: true,
              items: KartunList.map((kartun) {
                return DropdownMenuItem(
                  value: kartun,
                  child: Text(kartun),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedKartun = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  imageUrl = KartunImages[selectedKartun];
                });
              },
              child: const Text('Tampilkan Gambar'),
            ),
            const SizedBox(height: 16.0),
            if (imageUrl != null)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
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
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Center(
                        child: Text('Gagal memuat gambar'),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
