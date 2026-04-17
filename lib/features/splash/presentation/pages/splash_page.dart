import 'dart:async';

import 'package:be_kind_project/features/onboarding/presentation/pages/onboarding_page1.dart';
import 'package:be_kind_project/features/splash/domain/usecases/get_splash_duration_usecase.dart';
import 'package:be_kind_project/features/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = SplashController(
    const GetSplashDurationUseCase(),
  );
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _setupTimer();
  }

  Future<void> _setupTimer() async {
    final Duration duration = await _controller.getDuration();
    _navigationTimer = Timer(duration, () {
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => const OnboardingPage1()),
      );
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/7c3c6d2cb814ec07c053748ad45ae6b4613213b6.jpg',
          width: 300,
          height: 250,
        ),
      ),
    );
  }
}
