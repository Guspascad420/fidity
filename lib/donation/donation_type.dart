import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget donationType(String type, String imageRes) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(imageRes),
      const SizedBox(height: 10),
      Text(type,
          style: GoogleFonts.poppins(
           fontWeight: FontWeight.w600,
            fontSize: 17
          ))
    ],
  );
}