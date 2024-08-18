import 'package:fidity/notifications/notification_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 25)
        ),
        title: Text('Notifikasi',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, size: 25)
          )
        ],
      ),
      body: Column(
        children: [
          notificationContent()
        ],
      ),
    );
  }

}