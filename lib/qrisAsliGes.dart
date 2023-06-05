import 'package:flutter/material.dart';

void main() {
  runApp(KIRIK());
}

class KIRIK extends StatelessWidget {
  const KIRIK({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xFF343A40),
          title: Row(
            children: [
              Image.asset(
                'assets/images/bakudan.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              const SizedBox(width: 50),
              const Text("QRIS Payment")
            ],
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity, // Adjust the width according to your needs
            height: double.infinity, // Adjust the height according to your needs
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/qris_dmc.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
