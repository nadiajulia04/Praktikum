import 'package:flutter/material.dart';

class RadioButton01 extends StatefulWidget {
  @override
  _RadioButton01State createState() => _RadioButton01State();
}

class _RadioButton01State extends State<RadioButton01> {
  String _selectedHobby = ''; // Menyimpan hobi yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh RadioButton'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Hobi Anda:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildRadioListTile('Bermain Musik'),
            _buildRadioListTile('Olahraga'),
            _buildRadioListTile('Membaca'),
            SizedBox(height: 20),
            Text(
              'Hobi yang dipilih: ${_selectedHobby.isEmpty ? 'Belum dipilih' : _selectedHobby}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioListTile(String hobby) {
    return RadioListTile<String>(
      title: Text(hobby),
      value: hobby,
      groupValue: _selectedHobby,
      onChanged: (value) {
        setState(() {
          _selectedHobby = value!;
        });
      },
    );
  }
}
