import 'package:dmc_flutter/dPemes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(detailPesawat());
}

class detailPesawat extends StatelessWidget {
  detailPesawat({Key? key}) : super(key: key);

  final List<String> name = ['Garuda', 'Citilink', 'Lion'];
  final List<String> assetPath = [
    'assets/images/garuda.jpg',
    'assets/images/citilink.jpg',
    'assets/images/lion.jpg'
  ];

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
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: PesawatL(
                      assetPath: assetPath[index],
                      name: name[index],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pemesanan()));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class PesawatL extends StatelessWidget {
  PesawatL({required this.name, required this.assetPath});

  final String assetPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Container(
          width: 220.0,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  assetPath,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
