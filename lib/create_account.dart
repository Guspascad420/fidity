import 'dart:ui';

import 'package:fidity/database/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key, required this.role});

  final String role;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  DatabaseService service = DatabaseService();

  final validEmail = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
  );
  final validPassword = RegExp(r"^(?=.*[0-9]).{8,}$");
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isBothPasswordMatch = true;
  bool _isLoading = false;

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
        title: Text('Buat akun',
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground
            )),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
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
                                text: 'Buat ',
                                style: GoogleFonts.poppins(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.onBackground
                                ),
                                children: [
                                  TextSpan(text: 'akun ', style: GoogleFonts.poppins(
                                      color: Colors.orange, fontWeight: FontWeight.w600)
                                  ),
                                  const TextSpan(text: 'kamu dulu yuk!')
                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _fullNameTextController,
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
                      hintText: "Alamat Email",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF847E7C)
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      fillColor: Colors.grey[100],
                    ),
                  ),
                  _isEmailValid
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Format email salah!',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
                          )
                      ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordTextController,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
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
                  _isPasswordValid
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Password minimal 8 Karakter & mengandung angka',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
                          )
                      ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordConfirmTextController,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
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
                      hintText: "Konfirmasi Kata Sandi",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF847E7C)
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      fillColor: Colors.grey[100],
                    ),
                  ),
                  _isBothPasswordMatch
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Mohon sesuaikan password',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
                          )
                      ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: _passwordTextController.text.isEmpty ||
                            _emailTextController.text.isEmpty || _fullNameTextController.text.isEmpty
                            ? null
                            : () {
                              setState(() {
                                _isLoading = true;
                              });
                              validEmail.hasMatch(_emailTextController.text)
                                  ? setState(() {
                                    _isEmailValid = true;
                                  })
                                  : setState(() {
                                    _isEmailValid = false;
                                  });
                              setState(() {
                                _isPasswordValid =
                                validPassword.hasMatch(_passwordTextController.text)
                                    ? true : false;
                              });
                              setState(() {
                               _isBothPasswordMatch =
                               _passwordTextController.text == _passwordConfirmTextController.text
                                    ? true : false;
                              });

                              if (_isPasswordValid && _isEmailValid && _isBothPasswordMatch) {
                                auth
                                    .createUserWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                    .then((value) {
                                  var user = {
                                    'name': _fullNameTextController.text,
                                    'email': _emailTextController.text,
                                    'role': widget.role
                                  };
                                  service.createNewUser(user, auth.currentUser!.uid);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()),
                                          (route) => false);
                                });
                              }
                            },
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: const Color(0xFFED8C55),
                        ),
                        child: Text('Daftar',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ))
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}