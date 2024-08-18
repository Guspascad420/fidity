import 'package:fidity/create_account.dart';
import 'package:fidity/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  var _selectedRole = "Disabled";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            RichText(
              text: TextSpan(
                  text: 'Sebelum ',
                  style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onBackground
                  ),
                  children: [
                    TextSpan(text: 'masuk ', style: GoogleFonts.poppins(
                        color: Colors.orange, fontWeight: FontWeight.w600)
                    ),
                    const TextSpan(text: 'pilih peranmu yuk!')
                  ]
              ),
            ),
            const SizedBox(height: 10),
            Text(
                'Tentukan peran kamu untuk memulai perjalanan yang disesuaikan.',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.grey[500]
                )
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRole = "Disabled";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _selectedRole == "Disabled"
                                      ? Colors.orange
                                      : Colors.grey,
                                  width: 3
                              )
                          ),
                          child: Image.asset('images/wheelchair.png', scale: 2),
                        )
                    ),
                    const SizedBox(height: 10),
                    Text(
                        'Difabel',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        )
                    )
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRole = "Guardian";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(33),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _selectedRole == "Guardian"
                                      ? Colors.orange
                                      : Colors.grey,
                                  width: 3)
                          ),
                          child: Image.asset('images/shield.png', scale: 2),
                        )
                    ),
                    const SizedBox(height: 10),
                    Text(
                        'Pelindung',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        )
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('images/ingfo.svg'),
                        const SizedBox(width: 5),
                        Text(
                            'Informasi',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]
                            )
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                        'Tenang, Kamu bisa ubah pilihanmu pada bagian menu '
                            'profil. Letaknya di sudut kiri atas ya!',
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey[400]
                        )
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount(role: _selectedRole)
                                )
                            );
                          },
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFFED8C55),
                          ),
                          child: Text('Konfirmasi',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ))
                      )
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}