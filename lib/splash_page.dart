import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_page1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 20), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Image.asset(
          "assets/images/7c3c6d2cb814ec07c053748ad45ae6b4613213b6.jpg",
          width: 300,
          height: 250,
        ),
      ),
    );
  }
}
