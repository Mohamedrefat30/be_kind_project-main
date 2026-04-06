import 'package:be_kind_project/app_colors.dart';
import 'package:be_kind_project/auth_button.dart';
import 'package:be_kind_project/onboarding_dot.dart';
import 'package:be_kind_project/onboarding_page2.dart';
import 'package:be_kind_project/sign_language_page_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'onboarding-img',
              child: Image.asset(
                'assets/images/83aceb5d372bae7a10e416cb128a61d9688de0ae.png',
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OnboardingDot(isActive: true),
                OnboardingDot(isActive: false),
                OnboardingDot(isActive: false),
              ],
            ),
            Text(
              'Upload a sign language image',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.accentHeading,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Take or select a photo showing a sign language gesture.',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
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
                  SignLanguagePageRoute(page: const OnboardingPage2()),
                );
              },
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: 'Skip',
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
          ],
        ),
      ),
    );
  }
}
