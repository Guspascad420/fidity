import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FacilitiesPage extends StatefulWidget {
  const FacilitiesPage({super.key});

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFE354C),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.white, size: 35)
        ),
        title: Text('Fasilitas',
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white, size: 35)
          ),
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.white, size: 35)
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        color: const Color(0xFFFE354C),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(left: 20),
              child: Text('Jelajahi Fasilitas Khusus Buat Kamu Orang Yang Istimewa~',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 2, color: Colors.white),
                          backgroundColor: const Color(0xFFFE354C),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)// background
                      ),
                      child: Text('Cari Tau Yuk!',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ))
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 20),
                  child: Image.asset('images/blood_donate.png', scale: 2.2)
                )
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text('Fasilitas Terdekat',
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
                                    color: const Color(0xFFFE354C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ))
                          ),
                        )
                      ]
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: const EdgeInsets.only(left: 20),
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/rsub.png', scale: 2.5),
                          Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                              )
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('FASILITAS',
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF55A06F)
                                    )),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 206,
                                  child: Text('Rumah Sakit Universitas Brawijaya',
                                      style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(height: 10),
                                Text('1.0km • 15 min',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey
                                    )),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]
                )
              )
            )
          ],
        ),
      ),
    );
  }

}