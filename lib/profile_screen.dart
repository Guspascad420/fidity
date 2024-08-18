import 'package:fidity/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/bottom_nav_bar.dart';
import 'database/database_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DatabaseService service = DatabaseService();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _disabled = true;
  late Future<Map<String, dynamic>> futureUserData;

  @override
  void initState() {
    super.initState();
    futureUserData =
        service.retrieveUserData(auth.currentUser!.uid);
    futureUserData.then((value) => {
      setState(() {
        if (value["role"] == "Guardian") {
          _disabled = false;
        }
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/foreground_2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Container(
                alignment: Alignment.center,
                child: Image.asset('images/avatar.png', scale: 2.5,)
              ),
              FutureBuilder(
                  future: futureUserData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                     return Center(
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text(snapshot.data!["name"],
                               style: GoogleFonts.poppins(
                                   fontSize: 27,
                                   fontWeight: FontWeight.bold,
                               )),
                           Text(snapshot.data!["email"],
                               style: GoogleFonts.poppins(
                                   fontSize: 17,
                                   fontWeight: FontWeight.w500)),
                         ],
                       )
                     );
                    }
                    return SizedBox();
                  }
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35),
                    Text('Preferensi',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            )),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/community-2.png', scale: 2.5),
                            const SizedBox(width: 10),
                            Text('Ajak Teman',
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(height: 1, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('images/wheelchair-2.svg'),
                            const SizedBox(width: 10),
                            Text('Mode Disabilitas',
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Switch(
                            value: _disabled,
                            activeColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                _disabled = value;
                              });
                            }
                        )
                      ],
                    ),
                    const Divider(height: 1, color: Colors.grey),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('images/globe.svg'),
                            const SizedBox(width: 10),
                            Text('Bahasa Aplikasi',
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            auth.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const WelcomePage()),
                                    (route) => false
                            );
                          },
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFFFFDFDF),
                          ),
                          child: Text('Log out',
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ))
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(context: context, currentIndex: 3),
    );
  }

}