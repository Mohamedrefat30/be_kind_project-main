import 'package:be_kind_project/core/routing/sign_language_page_route.dart';
import 'package:be_kind_project/core/theme/app_colors.dart';
import 'package:be_kind_project/dependencies.dart';
import 'package:be_kind_project/features/auth/presentation/widgets/auth_button.dart';
import 'package:be_kind_project/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:be_kind_project/features/onboarding/presentation/pages/onboarding_page1.dart';
import 'package:be_kind_project/features/onboarding/presentation/pages/onboarding_page3.dart';
import 'package:be_kind_project/features/onboarding/presentation/widgets/onboarding_dot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController(
      Dependencies.getOnboardingStepsUseCase,
    );
    return FutureBuilder(
      future: controller.getStep(1),
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
                Image.asset(step.imageAsset),
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
                  step.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.accentHeading,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  step.description,
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
      },
    );
  }
}
