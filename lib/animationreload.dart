import 'package:flutter/material.dart';

class SignLanguagePageRoute extends PageRouteBuilder {
  final Widget page;

  SignLanguagePageRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // انميشن المسافة (الإزاحة)

          // انميشن الشفافية
          var fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: const Interval(0.2, 1.0)),
          );

          return Container(
            color: const Color(0xff9C6B73), // لون الخلفية اللي بيظهر في الفواصل
            child: FadeTransition(opacity: fadeIn),
          );
        },
      );
}
