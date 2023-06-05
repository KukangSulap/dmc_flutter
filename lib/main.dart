import 'package:dmc_flutter/home.dart';
import 'package:dmc_flutter/registrasi.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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
      _clearPref();
      _isObscure = !_isObscure;
    });
  }

  Future<void> _clearPref() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
  }

  Future<void> _saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
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
            controller: _textEmail,
            decoration: const InputDecoration(
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
            onPressed: () async {
              checkUser(_textEmail.text, _textPassword.text);
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationForm()));
                  // belum ada apa apa musti ditambah ke fungsi yang lain
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

  //Login user
  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();

  Future<void> checkUser(String email, String password) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('user')
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .get();

    if (snapshot.docs.isNotEmpty) {
      _saveEmail(email);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Page1Screen()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Username or password is salah.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
  //

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
                  const Text(
                    'Login',
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
