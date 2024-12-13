import 'package:flutter/material.dart';

class Contohstatelesswidget extends StatelessWidget {
  final TextEditingController _controllerPesan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(280),
        child: Column(
          children: [
            TextField(
              controller: _controllerPesan,
              decoration: InputDecoration(labelText: 'Masukan Pesan Anda:'),
            ),
            Text(
              'Pesan : ${_controllerPesan.text}',
            )
          ],
        ),
      ),
    );
  }
}
