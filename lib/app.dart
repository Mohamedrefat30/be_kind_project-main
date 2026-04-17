import 'package:be_kind_project/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class BeKindApp extends StatelessWidget {
  const BeKindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
