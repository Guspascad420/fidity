import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool _isError = false;
  bool _isLoading = false;

  void _checkAuthentication() async {
    auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const Home()),
                (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)
            ),
          ),
          title: Text('Login',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground
              )),
          centerTitle: true
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange
                    ),
                  )
                ),
                BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: RichText(
                        text: TextSpan(
                            text: 'Silahkan ',
                            style: GoogleFonts.poppins(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onBackground
                            ),
                            children: [
                              TextSpan(text: 'masuk ', style: GoogleFonts.poppins(
                                  color: Colors.orange, fontWeight: FontWeight.w600)
                              ),
                              const TextSpan(text: 'ke akunmu!')
                            ]
                        ),
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailTextController,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 1, color: Color(0xFFCFCBC9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 1, color: Color(0xFFCFCBC9)),
                ),
                filled: true,
                hintText: "Nama lengkap",
                hintStyle: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF847E7C)
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordTextController,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
              keyboardType: TextInputType.visiblePassword,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 1, color: Color(0xFFCFCBC9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 1, color: Color(0xFFCFCBC9)),
                ),
                filled: true,
                hintText: "Kata Sandi",
                hintStyle: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF847E7C)
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 10),
            _isError
                ? Text(
              'Email / Password kamu salah!',
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(fontSize: 12, color: Colors.red),
            )
                : const SizedBox(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Lupa Kata Sandi?',
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  color: Colors.grey[400],
                ),
              )
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                  onPressed: _passwordTextController.text.isEmpty ||
                      _emailTextController.text.isEmpty
                      ? null
                      : () async {
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await auth.signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text
                          );
                          _checkAuthentication();
                        } on FirebaseAuthException {
                          setState(() {
                            _isLoading = false;
                            _isError = true;
                          });
                        }
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color(0xFFED8C55),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('Masuk',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ))
              ),
            )
          ],
        ),
      ),
    );
  }
}