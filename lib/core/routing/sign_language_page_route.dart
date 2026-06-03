import 'package:flutter/material.dart';

class SignLanguagePageRoute extends PageRouteBuilder<void> {
  SignLanguagePageRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // الأنيميشن التدريجي الرائع الذي قمت بصناعته
          final fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: const Interval(0.2, 1.0)),
          );

          return ColoredBox(
            // ✅ تعديل: تغيير اللون إلى الأبيض ليمنع حدوث ومضة ملونة مفاجئة (Flash Effect)
            // لأن خلفيات الشاشات المستهدفة بيضاء، فيظهر الانتقال غاية في النعومة والاحترافية
            color: Colors.white,
            child: FadeTransition(opacity: fadeIn, child: child),
          );
        },
      );

  final Widget page;
}
