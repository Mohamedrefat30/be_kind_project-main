import 'package:be_kind_project/app_colors.dart';
import 'package:flutter/material.dart';

class SignLanguagePageRoute extends PageRouteBuilder<void> {
  SignLanguagePageRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: const Interval(0.2, 1.0)),
          );

          return ColoredBox(
            color: AppColors.accent,
            child: FadeTransition(opacity: fadeIn, child: child),
          );
        },
      );

  final Widget page;
}
