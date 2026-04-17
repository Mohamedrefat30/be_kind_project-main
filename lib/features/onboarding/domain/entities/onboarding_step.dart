class OnboardingStep {
  const OnboardingStep({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.activeIndex,
  });

  final String title;
  final String description;
  final String imageAsset;
  final int activeIndex;
}
