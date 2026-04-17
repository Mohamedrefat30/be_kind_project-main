import 'package:be_kind_project/core/routing/sign_language_page_route.dart';
import 'package:be_kind_project/core/theme/app_colors.dart';
import 'package:be_kind_project/dependencies.dart';
import 'package:be_kind_project/features/auth/presentation/widgets/auth_button.dart';
import 'package:be_kind_project/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:be_kind_project/features/onboarding/presentation/pages/onboarding_page2.dart';
import 'package:be_kind_project/features/onboarding/presentation/widgets/onboarding_dot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  final OnboardingController _controller = OnboardingController(
    Dependencies.getOnboardingStepsUseCase,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.getStep(0),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final step = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'onboarding-img',
                  child: Image.asset(step.imageAsset),
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
                  step.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.accentHeading,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  step.description,
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
      },
    );
  }
}
