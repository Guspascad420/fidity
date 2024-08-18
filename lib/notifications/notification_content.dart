import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget notificationContent() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Image.asset('images/alert.png', scale: 2),
            const SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Difabel di sekitar dalam bahaya!',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                    )),
                Text('Peringatan • 5 menit yang lalu',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                    )),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Image.asset('images/location_map.png', scale: 2)
      ],
    ),
  );
}