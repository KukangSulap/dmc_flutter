import 'package:dmc_flutter/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                // Logika untuk menyimpan data
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            subtitle: const TextField(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Last Name'),
            subtitle: const TextField(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Address'),
            subtitle: const TextField(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: const TextField(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Country'),
            subtitle: const TextField(),
          ),
          const Divider(),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog();
                },
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
