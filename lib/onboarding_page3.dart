import 'package:be_kind_project/app_colors.dart';
import 'package:be_kind_project/auth_button.dart';
import 'package:be_kind_project/onboarding_dot.dart';
import 'package:be_kind_project/onboarding_page2.dart';
import 'package:be_kind_project/sign_language_page_route.dart';
import 'package:be_kind_project/splash_page2.dart';
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
              'assets/images/149fddd3a5f1f763de918393147feec5dbcd4198 (1).jpg',
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OnboardingDot(isActive: false),
                OnboardingDot(isActive: false),
                OnboardingDot(isActive: true),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.accentHeading,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Start translating sign language with ease',
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
                  SignLanguagePageRoute(page: const SplashPage2()),
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
