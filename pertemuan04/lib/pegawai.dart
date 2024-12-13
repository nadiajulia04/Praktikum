import 'package:flutter/material.dart';

class Gaji {
  int calculateGajiPokok(String? status) {
    // Gaji pokok berdasarkan status
    if (status == "Menikah") {
      return 5000000; // Contoh gaji pokok untuk status menikah
    } else {
      return 4000000; // Contoh gaji pokok untuk status belum menikah
    }
  }
}

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});

  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String? nip;
  String? nama;
  String? pilihanGolongan;
  String? pilihanStatus;

  int calculateTunjangan() {
    int tunjangan = 0;

    if (pilihanGolongan == "I") {
      tunjangan = 2500000;
    } else if (pilihanGolongan == "II") {
      tunjangan = 3000000;
    } else if (pilihanGolongan == "III") {
      tunjangan = 3500000;
    } else {
      tunjangan = 400000;
    }

    return tunjangan;
  }

  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();

  var salary = Gaji();

  final List<String> golongan = ['I', 'II', 'III'];
  final List<String> status = ['Menikah', 'Belum Menikah'];

  int totalGaji = 0;

  void hitungGaji() {
    int tunjangan = calculateTunjangan();
    int gajiPokok = salary.calculateGajiPokok(pilihanStatus);
    setState(() {
      totalGaji = gajiPokok + tunjangan;
    });

    // Tampilkan hasil perhitungan gaji
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hasil Gaji"),
          content: Text(
              "Nama: $nama\nNIP: $nip\nGolongan: $pilihanGolongan\nStatus: $pilihanStatus\nGaji Pokok: Rp $gajiPokok\nTunjangan: Rp $tunjangan\nTotal Gaji: Rp $totalGaji"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: const Color.fromARGB(255, 154, 151, 152),
      ),
      body: Column(
        children: [
          TextField(
            controller: nipController,
            decoration: const InputDecoration(labelText: 'NIP Pegawai'),
            onChanged: (value) {
              setState(() {
                nip = value;
              });
            },
          ),
          TextField(
            controller: namaController,
            decoration: const InputDecoration(labelText: 'Nama Pegawai'),
            onChanged: (value) {
              setState(() {
                nama = value;
              });
            },
          ),
          DropdownButton<String>(
            hint: const Text('Golongan Pegawai'),
            value: pilihanGolongan,
            onChanged: (String? value) {
              setState(() {
                pilihanGolongan = value;
              });
            },
            items: golongan.map<DropdownMenuItem<String>>((String isi) {
              return DropdownMenuItem<String>(
                value: isi,
                child: Text(isi),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            hint: const Text('Status Pegawai'),
            value: pilihanStatus,
            onChanged: (String? value) {
              setState(() {
                pilihanStatus = value;
              });
            },
            items: status.map<DropdownMenuItem<String>>((String isi) {
              return DropdownMenuItem<String>(
                value: isi,
                child: Text(isi),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: hitungGaji,
            child: const Text('Hitung Gaji'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
