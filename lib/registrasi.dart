import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(RegistrationForm());
}

class RegistrationForm extends StatelessWidget {
  RegistrationForm({super.key});

  //Register User
  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();
  final TextEditingController _textNamaDepan = TextEditingController();
  final TextEditingController _textNamaBelakang = TextEditingController();

  Future inputUser(
      {required String email, password, namaDepan, namaBel}) async {
    final register = FirebaseFirestore.instance.collection('user').doc();

    final json = {
      'email': email,
      'password': password,
      'nama_depan': namaDepan,
      'nama_belakang': namaBel,
    };

    await register.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Form Registrasi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _textNamaDepan,
                        decoration: const InputDecoration(
                          labelText: 'Nama Depan',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Depan harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _textNamaBelakang,
                        decoration: const InputDecoration(
                          labelText: 'Nama Belakang',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Belakang harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _textEmail,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email harus diisi';
                          }
                          if (!value.contains('@')) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _textPassword,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password harus diisi';
                          }
                          if (value.length < 6) {
                            return 'Password minimal 6 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          inputUser(
                              email: _textEmail.text,
                              password: _textPassword.text,
                              namaBel: _textNamaBelakang.text,
                              namaDepan: _textNamaDepan.text);
                          Navigator.pop(context);
                        },
                        child: const Text('Daftar'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Sudah punya akun?'),
                          const SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              // TODO: Implementasi action saat teks Login di tap
                              Navigator.pop(context);
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
