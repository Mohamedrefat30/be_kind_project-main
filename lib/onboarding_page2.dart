import 'package:be_kind_project/app_colors.dart';
import 'package:be_kind_project/auth_button.dart';
import 'package:be_kind_project/onboarding_dot.dart';
import 'package:be_kind_project/onboarding_page1.dart';
import 'package:be_kind_project/onboarding_page3.dart';
import 'package:be_kind_project/sign_language_page_route.dart';
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
              'assets/images/32f506beb83ca431529755a8309c89c9ff461da5.jpg',
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OnboardingDot(isActive: false),
                OnboardingDot(isActive: true),
                OnboardingDot(isActive: false),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Convert it to text or voice',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.accentHeading,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Our app will accurately translate the sign\n'
              'language into written text or spoken words.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                fontSize: 15,
                color: AppColors.accent,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),
            AuthButton(
              text: 'Next',
              color: AppColors.accent,
              onPressed: () {
                Navigator.push(
                  context,
                  SignLanguagePageRoute(page: const OnboardingPage3()),
                );
              },
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: 'Back',
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
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
