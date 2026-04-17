import 'package:be_kind_project/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:be_kind_project/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:be_kind_project/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this._localDataSource);

  final OnboardingLocalDataSource _localDataSource;

  @override
  Future<List<OnboardingStep>> getSteps() {
    return _localDataSource.getSteps();
  }
}
