import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget onboardingContent(String title, String subtitle, String imageRes,
    [double? imageMarginTop, bool? alignEnd]) {
  return Column(
      children: [
        const SizedBox(height: 80),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),
              Text(subtitle,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ],
          ),
        ),
        SizedBox(height: imageMarginTop ?? 20),
        Align(
          alignment: alignEnd != null
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.center,
          child: Image.asset(imageRes, scale: 3),
        )
      ]
  );
}
