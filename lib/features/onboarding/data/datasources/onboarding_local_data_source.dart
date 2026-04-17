import 'package:be_kind_project/features/onboarding/data/models/onboarding_step_model.dart';

class OnboardingLocalDataSource {
  const OnboardingLocalDataSource();

  Future<List<OnboardingStepModel>> getSteps() async {
    return const <OnboardingStepModel>[
      OnboardingStepModel(
        title: 'Upload a sign language image',
        description: 'Take or select a photo showing a sign language gesture.',
        imageAsset:
            'assets/images/83aceb5d372bae7a10e416cb128a61d9688de0ae.png',
        activeIndex: 0,
      ),
      OnboardingStepModel(
        title: 'Convert it to text or voice',
        description:
            'Our app will accurately translate the sign\nlanguage into written text or spoken words.',
        imageAsset:
            'assets/images/32f506beb83ca431529755a8309c89c9ff461da5.jpg',
        activeIndex: 1,
      ),
      OnboardingStepModel(
        title: 'Get Started',
        description: 'Start translating sign language with ease',
        imageAsset:
            'assets/images/149fddd3a5f1f763de918393147feec5dbcd4198 (1).jpg',
        activeIndex: 2,
      ),
    ];
  }
}
