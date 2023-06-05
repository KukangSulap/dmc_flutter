import 'package:dmc_flutter/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                updateData();
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
  void initState() {
    super.initState();
    fetchData();
  }

  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textNamaDepan = TextEditingController();
  final TextEditingController _textNamaBelakang = TextEditingController();
  final TextEditingController _textAddress = TextEditingController();
  final TextEditingController _textCountry = TextEditingController();

  //Clear Controller
  void clearController() {
    _textEmail.clear();
    _textNamaDepan.clear();
    _textNamaBelakang.clear();
    _textAddress.clear();
    _textCountry.clear();
  }
  //

  //Update Data
  Future<void> updateData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');

    if (email != null) {
      final QuerySnapshot profilesSnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: email)
          .get();

      final List<QueryDocumentSnapshot> profiles = profilesSnapshot.docs;

      for (final profileDoc in profiles) {
        try {
          await profileDoc.reference.update({
            'nama_depan': _textNamaDepan.text,
            'nama_belakang': _textNamaBelakang.text,
            'address': _textAddress.text,
            'country': _textCountry.text,
          });
          print('Profile data updated successfully!');
        } catch (e) {
          print('Error updating profile data: $e');
        }
      }
    }
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
          _textEmail.text = userData['email'];
          _textNamaDepan.text = userData['nama_depan'];
          _textNamaBelakang.text = userData['nama_belakang'];
          _textAddress.text = userData['address'];
          _textCountry.text = userData['country'];
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
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: TextField(
              enabled: false,
              controller: _textEmail,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('First Name'),
            subtitle: TextField(
              controller: _textNamaDepan,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Last Name'),
            subtitle: TextField(
              controller: _textNamaBelakang,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Address'),
            subtitle: TextField(
              controller: _textAddress,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Country'),
            subtitle: TextField(
              controller: _textCountry,
            ),
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
