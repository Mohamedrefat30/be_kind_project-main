import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:be_kind_project/main.dart';
import 'package:be_kind_project/splash_page.dart';

void main() {
  testWidgets('app shows splash as initial route', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(SplashPage), findsOneWidget);
  });
}
