import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmc_flutter/metodePembayaran.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
  final _namaController = TextEditingController();
  final _asalController = TextEditingController();
  final _tujuanController = TextEditingController();
  final _namakenController = TextEditingController();
  final _hargaController = TextEditingController();
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
                child: TextField(
                  controller: _namaController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
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
                child: TextField(
                  controller: _namakenController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
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
                child: TextField(
                  controller: _asalController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
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
                child: TextField(
                  controller: _tujuanController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
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
                child: TextField(
                  controller: _hargaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  final name = _namaController.text;
                  final namaKen = _namakenController.text;
                  final asal = _asalController.text;
                  final tujuan = _tujuanController.text;
                  final harga = _hargaController.text;
                  inputPemes(
                      name: name,
                      namaKen: namaKen,
                      asal: asal,
                      tujuan: tujuan,
                      harga: harga);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentListPage()));
                },
                child: const Text("Lanjut ke Pembayaran"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future inputPemes(
      {required String name, namaKen, asal, tujuan, harga}) async {
    final docPemes = FirebaseFirestore.instance.collection('pemesanan').doc();

    final json = {
      'idPem': docPemes.id,
      'nama_user': name,
      'nama_kendaraan': namaKen,
      'asal': asal,
      'tujuan': tujuan,
      'harga': harga,
    };

    await docPemes.set(json);
  }
}
