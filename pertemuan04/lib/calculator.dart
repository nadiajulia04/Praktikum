import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  void calculateAndNavigate(String operation) {
    double num1 = double.tryParse(_firstNumberController.text) ?? 0.0;
    double num2 = double.tryParse(_secondNumberController.text) ?? 0.0;
    double? result;

    if (operation == "+") {
      result = num1 + num2;
    } else if (operation == "-") {
      result = num1 - num2;
    } else if (operation == "*") {
      result = num1 * num2;
    } else if (operation == "/") {
      result = num2 != 0 ? num1 / num2 : double.nan;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          result: result!.isNaN
              ? "Tidak dapat membagi dengan nol"
              : result.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE), // Warna abu-abu muda
      appBar: AppBar(
        title: Text("Pemilihan Perhitungan"),
        backgroundColor: Color(0xFF757575), // Warna abu-abu tua
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              decoration: InputDecoration(
                labelText: "Masukkan Angka 1",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _secondNumberController,
              decoration: InputDecoration(
                labelText: "Masukkan Angka 2",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () => calculateAndNavigate("+"),
                  child: Text("+"),
                ),
                OutlinedButton(
                  onPressed: () => calculateAndNavigate("-"),
                  child: Text("-"),
                ),
                OutlinedButton(
                  onPressed: () => calculateAndNavigate("*"),
                  child: Text("×"),
                ),
                OutlinedButton(
                  onPressed: () => calculateAndNavigate("/"),
                  child: Text("÷"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text("Hasil Perhitungan"),
        backgroundColor: Color(0xFF757575),
      ),
      body: Center(
        child: Text(
          "Hasil: $result",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF757575),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
