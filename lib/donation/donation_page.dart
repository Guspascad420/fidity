import 'package:fidity/donation/donation_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFEE635),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: Colors.black, size: 35)
          ),
          title: Text('Donasi',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.black, size: 35)
            ),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.black, size: 35)
            ),
          ],
        ),
      body: Container(
        color: const Color(0xFFFEE635),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  donationType('Top Up', 'images/add.svg'),
                  donationType('Scan QR', 'images/scan.svg'),
                  donationType('Dompet', 'images/wallet.svg'),
                  donationType('Riwayat', 'images/history.svg')
                ],
              )
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}