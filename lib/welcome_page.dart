import 'package:fidity/choose_role.dart';
import 'package:fidity/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC15203),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.32),
            child: Image.asset('images/foreground.png'),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.34,),
              Image.asset('images/logo_fidity.png', scale: 2.5),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ChooseRole()
                          )
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('Gabung Sekarang',
                        style: GoogleFonts.poppins(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ))
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()
                          )
                      );
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFFED8C55),
                    ),
                    child: Text('Masuk',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ))
                ),
              )
            ],
          ),
        ],
      )
    );
  }

}