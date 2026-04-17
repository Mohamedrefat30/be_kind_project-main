import 'package:be_kind_project/features/onboarding/domain/entities/onboarding_step.dart';

class OnboardingStepModel extends OnboardingStep {
  const OnboardingStepModel({
    required super.title,
    required super.description,
    required super.imageAsset,
    required super.activeIndex,
  });
}
