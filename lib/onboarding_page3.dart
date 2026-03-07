import 'package:be_kind_project/animationreload.dart';
import 'package:be_kind_project/buildAuthmethod.dart';
import 'package:be_kind_project/dots.dart';
import 'package:be_kind_project/onboarding_page2.dart';
import 'package:be_kind_project/splach_page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

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
              "assets/images/149fddd3a5f1f763de918393147feec5dbcd4198 (1).jpg",
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TheDots(isActive: false),
                TheDots(isActive: false),
                TheDots(isActive: true),
              ],
            ),
            SizedBox(height: 30),

            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xffBC7A88),
              ),
            ),
            const SizedBox(height: 10),

            Text(
              "Start translating language with eats",
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
                  SignLanguagePageRoute(page: const SplachPage2()),
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
                    builder: (context) => const OnboardingPage2(),
                  ),
                );
              },
              textColor: Colors.black,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
