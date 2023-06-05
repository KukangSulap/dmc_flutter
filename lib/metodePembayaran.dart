import 'package:flutter/material.dart';
import 'package:dmc_flutter/qrisAsliGes.dart';

class PaymentListPage extends StatelessWidget {
  final List<PaymentItem> paymentList = [
    PaymentItem('BCA', 'https://images.tokopedia.net/img/toppay/sprites/bca.png'),
    PaymentItem('QRIS', 'https://images.tokopedia.net/img/toppay/sprites/QRIS.png'),
    PaymentItem('Kartu Kredit / Debit', 'https://images.tokopedia.net/icons/icon-cc-green-v1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
        body: ListView.builder(
          itemCount: paymentList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network(
                      paymentList[index].logoUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16.0),
                      Text(
                        paymentList[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => const KIRIK())
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PaymentItem {
  final String name;
  final String logoUrl;

  PaymentItem(this.name, this.logoUrl);
}
