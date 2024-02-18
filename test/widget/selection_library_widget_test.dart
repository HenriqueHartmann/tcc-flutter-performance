import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tcc_performance_app/main.dart';

void main() {
  testWidgets('Find Selection Library Widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key('setStateSelection')), findsOneWidget);
    expect(find.byKey(const Key('providerSelection')), findsOneWidget);
    expect(find.byKey(const Key('blocSelection')), findsOneWidget);
  });
}
