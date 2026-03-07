import 'package:be_kind_project/animationreload.dart';
import 'package:be_kind_project/buildAuthmethod.dart';
import 'package:be_kind_project/dots.dart';
import 'package:be_kind_project/onboarding_page1.dart';
import 'package:be_kind_project/onboarding_page3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/32f506beb83ca431529755a8309c89c9ff461da5.jpg",
            ),

            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TheDots(isActive: false),
                TheDots(isActive: true),
                TheDots(isActive: false),
              ],
            ),
            SizedBox(height: 50),

            Text(
              "Convert it to text or voice",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xffBC7A88),
              ),
            ),
            const SizedBox(height: 10),

            Text(
              "Our app will accurately translate the sign\nlanguage into written text or spoken words.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                fontSize: 15,
                color: const Color(0xff9C6B73),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),

            Authbutton(
              text: "Next",
              color: const Color(0xff9C6B73),

              onPressed: () {
                Navigator.push(
                  context,
                  SignLanguagePageRoute(page: const OnboardingPage3()),
                );
              },
              textColor: Colors.white,
            ),

            const SizedBox(height: 20),

            Authbutton(
              text: "Back",
              color: Colors.white,

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingPage1(),
                  ),
                );
              },
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
