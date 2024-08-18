import 'package:fidity/components/bottom_nav_bar.dart';
import 'package:fidity/map/fidity_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detection extends StatefulWidget {
  const Detection({super.key});

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavBar(context: context, currentIndex: 1),
      body: Container(
        margin: const EdgeInsets.only(left: 2),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/group_3.png'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.28),
            Text("Deteksi lokasinya yuk!",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )),
            const SizedBox(height: 10),
            Text("Fidity bisa bantu deteksi kemana aja.",
                style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Colors.white
                )),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const FidityMap()
                          )
                      );
                    },
                    child: Image.asset('images/location_map.png', scale: 2)
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.orange),
                            const SizedBox(width: 10),
                            Text("Cari lokasi pelacakan",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: Colors.grey[700]
                                )),
                          ],
                        ),
                        Icon(Icons.search, color: Colors.grey[700])
                      ],
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