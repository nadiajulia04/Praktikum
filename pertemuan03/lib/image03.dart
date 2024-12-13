import 'package:flutter/material.dart';

class Image03 extends StatelessWidget {
  const Image03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        //Agar konten dapat digulir
        child: Column(
          children: [
            buildImageCard('assets/Gambar1.jpeg', Colors.red),
            buildImageCard('assets/Gambar2.jpeg', Colors.green),
            buildImageCard('assets/Gambar3.jpeg', Colors.blue),
            buildImageCard('assets/Gambar4.jpeg', Colors.yellow),
            buildImageCard('assets/Gambar5.jpeg', Colors.orange),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imagePath, Color color) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          height: 150.0,
          width: double.infinity,
        ),
      ),
    );
  }
}
