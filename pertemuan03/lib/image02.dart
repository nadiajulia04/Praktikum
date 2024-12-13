import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            Image.asset('assets/Gambar1.jpeg'), // Gambar 1
            Image.asset('assets/Gambar2.jpeg'), // Gambar 2
            Image.asset('assets/Gambar3.jpeg'), // Gambar 3
            Image.asset('assets/Gambar4.jpeg'), // Gambar 4
            Image.asset('assets/Gambar5.jpeg'), // Gambar 5
          ],
        ),
      ),
    );
  }
}
