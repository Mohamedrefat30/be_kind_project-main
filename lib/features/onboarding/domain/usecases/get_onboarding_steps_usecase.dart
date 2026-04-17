import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:be_kind_project/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetOnboardingStepsUseCase
    implements UseCase<List<OnboardingStep>, NoParams> {
  const GetOnboardingStepsUseCase(this._repository);

  final OnboardingRepository _repository;

  @override
  Future<List<OnboardingStep>> call(NoParams params) {
    return _repository.getSteps();
  }
}
