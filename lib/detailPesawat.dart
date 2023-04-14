import 'package:dmc_flutter/dPemes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const detailPesawat());
}

class detailPesawat extends StatelessWidget {
  const detailPesawat({super.key});

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
              const Text("Detail List Pesawat")
            ],
          ),
        ),
        body: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nama Pesawat ',
                icon: Icon(
                  Icons.search,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  height: 600,
                  width: 9000,
                  child: Image(image: AssetImage("assets/images/garuda.jpg")),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Pemesanan()));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                height: 600,
                width: 9000,
                child: Image(image: AssetImage("assets/images/citilink.jpg")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                height: 600,
                width: 9000,
                child: Image(image: AssetImage("assets/images/lion.jpg")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
