import 'package:fidity/detection.dart';
import 'package:fidity/home/home.dart';
import 'package:fidity/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  final BuildContext context;
  final int currentIndex;

  const BottomNavBar({super.key, required this.context, required this.currentIndex});

  void onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const Home()
          )
      );
    } else if (index == 1) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const Detection()
          )
      );
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const ProfileScreen()
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
            color: Theme.of(context).colorScheme.onPrimary
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            showUnselectedLabels: true,
            selectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
                color: Colors.grey[500]
            ),
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Beranda'
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('images/compass.png', scale: 2.5),
                  activeIcon: SvgPicture.asset('images/compass_active.svg'),
                  label: 'Deteksi'
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Obrolan'
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('images/profile.png', scale: 2.5),
                  activeIcon: Image.asset('images/profile_active.png', scale: 2.5),
                  label: 'Profil'
              )
            ],
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey[500],
            currentIndex: currentIndex,
            onTap: onItemTapped,
          ),
        )
    );
  }
}