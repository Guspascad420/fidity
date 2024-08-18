import 'package:fidity/onboarding/onboarding_content.dart';
import 'package:fidity/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15,
              left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotColor: Color(0xFFCB682A),
                        activeDotColor: Colors.white
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text('Lewati',
                          style: GoogleFonts.inter(
                              fontSize: 16, color: Colors.white
                          ))
                  ),
                ],
              ),
              _currentPage == 2
                  ? ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const WelcomePage()
                              )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                        ),
                        child: Text('Ayo mulai!',
                            style: GoogleFonts.poppins(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ))
                    )
                  : ElevatedButton(
                        onPressed: () {
                          controller.jumpToPage(_currentPage + 1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                        ),
                        child: Text('Lanjut',
                            style: GoogleFonts.poppins(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ))
                    )
            ],
          )
      ),
      body: PageView(
        controller: controller,
        children: [
          onboardingContent('Berbuat kebaikan hanya dalam genggaman',
              'Deteksi setiap lokasi dengan melacak orang yang membutuhkan pertolongan',
              'images/car.png', 20, true),
          onboardingContent('Temukan letak indahnya keberagaman',
              'Kamu terhubung untuk saling peduli dengan kasih sayang',
              'images/peeps.png'),
          onboardingContent('Komunitas untuk para penyintas',
              'Berbuat kebaikan tanpa batas dengan bergabung dalam komunitas',
              'images/nursing_home.png', 50)
        ],
      ),
    );
  }

}