                                                                                                                                                                                                                                                                                                                  import 'package:flutter/material.dart';
import 'package:dmc_flutter/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pemesanan(),
    );
  }
}

class Pemesanan extends StatefulWidget {
  const Pemesanan({super.key});

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(width: 20),
            const Text("Detail Pemesanan")
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              //Nama Lengkap
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const Text("Nama Lengkap"),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Gerry William"),
                ),
              ),

              //Nama Kendaraan
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const Text("Nama Kendaraan"),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Pesawat"),
                ),
              ),

              //Asal Berangkat
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const Text("Asal Berangkat"),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bekasi; 20 April 2023; 09.00"),
                ),
              ),

              //Tujuan Berangkat
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const Text("Tujuan Berangkat"),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bandung; 20 April 2023; 11.30"),
                ),
              ),

              //Harga
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const Text("Harga"),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "75.000"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {},
                child: const Text("Lanjut ke Pembayaran"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
