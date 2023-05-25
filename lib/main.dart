import 'package:dmc_flutter/home.dart';
import 'package:dmc_flutter/registrasi.dart';
import 'package:flutter/material.dart';
import 'package:dmc_flutter/dPemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Widget
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

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

  Widget _buildLoginForm() {
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
            decoration: InputDecoration(
              labelText: 'Email',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Page1Screen()));
            },
            child: Text('Login'),
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
              Text('Belum punya akun?'),
              TextButton(
                onPressed: () {
                  // belum ada apa apa musti ditambah ke fungsi yang lain
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationForm()));
                },
                child: Text('Daftar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  //endWidget

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
                  SizedBox(height: 150.0),
                  Text(
                    'Form Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  _buildLoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
