import 'package:dmc_flutter/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAccount(title: 'Profile Page'),
    );
  }
}

class MyAccount extends StatefulWidget {
  const MyAccount({super.key, required this.title});
  final String title;
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Page1Screen()));
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/bakudan.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            const SizedBox(width: 50),
            const Text("Profile")
          ],
        ),
        backgroundColor: const Color(0xFF343A40),
      ),
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('First Name'),
            subtitle: const Text('Your First Name'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Fungsi edit nanti disini
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Last Name'),
            subtitle: const Text('Your Last Name'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Fungsi edit nanti disini
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Address'),
            subtitle: const Text('Your Address'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Fungsi edit nanti disini
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: const Text('Your Email'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Fungsi edit nanti disini
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Country'),
            subtitle: const Text('Your Country'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Fungsi edit nanti disini
              },
            ),
          ),
          const Divider(),
          const Spacer(),
        ],
      ),
    );
  }
}
