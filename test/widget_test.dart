import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:be_kind_project/app.dart';
import 'package:be_kind_project/features/splash/presentation/pages/splash_page.dart';

void main() {
  testWidgets('app shows splash as initial route', (WidgetTester tester) async {
    await tester.pumpWidget(const BeKindApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(SplashPage), findsOneWidget);
  });
}
