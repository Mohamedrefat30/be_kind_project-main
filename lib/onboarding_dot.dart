import 'package:be_kind_project/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingDot extends StatelessWidget {
  const OnboardingDot({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.accent : AppColors.dotInactive,
        shape: BoxShape.circle,
      ),
    );
  }
}
