import 'package:fidity/community.dart';
import 'package:fidity/components/bottom_nav_bar.dart';
import 'package:fidity/donation/donation_page.dart';
import 'package:fidity/facilities.dart';
import 'package:fidity/home/feature_icon.dart';
import 'package:fidity/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var featureIcons = [
    FeatureIcon(name: 'Fasilitas', bgColor: Colors.red,
        iconRes: 'images/hospital.png', paddingSize: 15, 
        widgetDestination: const FacilitiesPage()),
    FeatureIcon(name: 'Lapor', bgColor: Colors.orange,
        iconRes: 'images/alarm.png', paddingSize: 20,
        widgetDestination: const FacilitiesPage()),
    FeatureIcon(name: 'Donasi', bgColor: Colors.yellow,
        iconRes: 'images/compassion.png', paddingSize: 15,
        widgetDestination: const DonationPage()),
    FeatureIcon(name: 'Komunitas', bgColor: Colors.green,
        iconRes: 'images/community.png', paddingSize: 20,
        widgetDestination: const CommunitiesPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Lowokwaru',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onBackground
                    )),
                const SizedBox(width: 10),
                const Icon(Icons.location_on, color: Colors.orange)
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Notifications()
                        )
                    );
                  },
                  icon: const Icon(Icons.notifications, color: Colors.orange,
                    size: 35)
              )
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(context: context, currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Color(0xFFFE8235),
                    Color(0xFFFEBCA6),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var feature in featureIcons)
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => feature.widgetDestination
                                        )
                                      );
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(feature.paddingSize),
                                              margin: const EdgeInsets.only(bottom: 5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: feature.bgColor
                                              ),
                                              child: Image.asset(feature.iconRes, scale: 2,),
                                            ),
                                            Text(feature.name,
                                                style: GoogleFonts.inter(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        )
                                    )
                                  )

                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFEDE8),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Fidity',
                                          style: GoogleFonts.poppins(
                                            color: Colors.brown[700],
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      Container(
                                        margin: const EdgeInsets.only(top: 5, bottom: 15),
                                        width: 200,
                                        child: Text('Kamu terhubung untuk saling peduli dengan kasih sayang.',
                                            style: GoogleFonts.poppins(
                                              color: Colors.brown[700],
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.orange,
                                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)// background
                                          ),
                                          child: Text('Donasi Yuk!',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ))
                                      ),
                                      const SizedBox(height: 10)
                                    ],
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 30),
                                      child: Image.asset('images/people.png', scale: 2.5)
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Text('Tantangan Terbatas',
                                        style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ))
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text('LIHAT SEMUA',
                                          style: GoogleFonts.poppins(
                                            color: Colors.orange,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              margin: const EdgeInsets.only(left: 20, bottom: 20),
                              child: Container(
                                padding: const EdgeInsets.only(top: 10, bottom: 10,
                                    left: 15, right: 25),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('images/track.png', scale: 2.5),
                                    const SizedBox(height: 10),
                                    Text('RUTINITAS',
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF55A06F)
                                        )),
                                    SizedBox(
                                      width: 150,
                                      child: Text('4 x 12 jam Melacak',
                                          style: GoogleFonts.poppins(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ),
                                    const SizedBox(height: 10),
                                    Text('28 Nov - 12 Des',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey
                                        ))
                                  ],
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20,
                              top: MediaQuery.of(context).size.height * 0.26),
                          child: TextField(
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500]
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(width: 1, color: Color(0xFFCFCBC9)),
                              ),
                              filled: true,
                              hintText: "Cari bantuan, layanan, & tujuan",
                              fillColor: Colors.grey[100],
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 15, right: 10),
                                  child: const Icon(Icons.search, size: 40,)
                              ),
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      )
    );
  }

}