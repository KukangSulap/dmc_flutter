import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

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
  //

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: _textNamaDepan,
            decoration: InputDecoration(
              labelText: 'First Name',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _textNamaBelakang,
            decoration: InputDecoration(
              labelText: 'Last Name',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _textEmail,
            decoration: InputDecoration(
              labelText: 'Email',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _textPassword,
            obscureText: _isObscure,
            decoration: InputDecoration(
              labelText: 'Password',
              fillColor: Colors.white,
              filled: true,
              suffixIcon: IconButton(
                onPressed: _toggleObscure,
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              inputUser(
                  email: _textEmail.text,
                  namaDepan: _textNamaDepan.text,
                  namaBel: _textNamaBelakang.text,
                  password: _textPassword.text);
              Navigator.pop(context);
            },
            child: Text('Register'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sudah punya akun?'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.0),
                  const Text(
                    'Registrasi',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  _buildRegistrationForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
