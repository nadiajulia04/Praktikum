import 'package:flutter/material.dart';
import 'pegawai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan04',
      home: Pegawai(),
    );
  }
}
