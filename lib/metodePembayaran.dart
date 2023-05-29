import 'package:flutter/material.dart';

class PaymentListPage extends StatelessWidget {
  final List<PaymentItem> paymentList = [
    PaymentItem('Paypal', 'https://img.freepik.com/free-icon/paypal_318-674245.jpg'),
    PaymentItem('Payment 2', 'https://img.freepik.com/free-icon/paypal_318-674245.jpg'),
    PaymentItem('Payment 3', 'https://img.freepik.com/free-icon/paypal_318-674245.jpg'),
    // Add more payment items as needed
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
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(paymentList[index].logoUrl),
                      ),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      paymentList[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle payment item tap
                    // You can navigate to a details page or perform any desired action
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
