import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmc_flutter/metodePembayaran.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _asalController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
  final TextEditingController _namakenController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
    _loadKendaraan();
  }

  //Mengambil data kendaraan sesuai yang dipilih
  Future<void> _loadKendaraan() async {
    final perfs = await SharedPreferences.getInstance();
    String kendaraan = perfs.getString('kendaraan') ?? '';
    setState(() {
      _namakenController.text = kendaraan;
    });
  }
  //

  //Mengambil data dari database
  Future<void> fetchData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? email = prefs.getString('email');

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('user')
              .where('email', isEqualTo: email)
              .get();

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        setState(() {
          _namaController.text =
              ('${userData['nama_depan']} ${userData['nama_belakang']}');
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
  //

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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
