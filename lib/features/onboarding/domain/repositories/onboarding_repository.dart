import 'package:be_kind_project/features/onboarding/domain/entities/onboarding_step.dart';

abstract class OnboardingRepository {
  Future<List<OnboardingStep>> getSteps();
}
