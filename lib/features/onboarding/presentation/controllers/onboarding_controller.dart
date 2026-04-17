import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:be_kind_project/features/onboarding/domain/usecases/get_onboarding_steps_usecase.dart';

class OnboardingController {
  const OnboardingController(this._getOnboardingStepsUseCase);

  final GetOnboardingStepsUseCase _getOnboardingStepsUseCase;

  Future<OnboardingStep> getStep(int index) async {
    final List<OnboardingStep> steps = await _getOnboardingStepsUseCase(
      const NoParams(),
    );
    return steps[index];
  }
}
