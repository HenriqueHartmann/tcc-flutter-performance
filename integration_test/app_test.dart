import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tcc_performance_app/main.dart' as app;
import 'package:tcc_performance_app/src/features/setState/main_setState.dart';

void main() {
  // Ensure that the emulator is initialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('setState', () {
    testWidgets('Choose SetState in the index', (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Define the keys needed for the selection test
      const setStateMainKey = const Key('setStateSelection');
      const setStateChildKey = const Key('libSelectionItem');

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(setStateChildKey),
          matching: find.byKey(setStateMainKey)));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Define the key need to check weather selection was successful
      const setStatePageKey = const Key('setStatePage');

      // Expecters
      expect(find.byKey(setStatePageKey), findsOneWidget);
    });

    testWidgets('Change all card colors in SetState page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Define the keys needed for the selection test
      const setStateMainKey = const Key('setStateSelection');
      const setStateChildKey = const Key('libSelectionItem');

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(setStateChildKey),
          matching: find.byKey(setStateMainKey)));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Define the key need to check weather selection was successful
      const setStatePageKey = const Key('setStatePage');

      expect(find.byKey(setStatePageKey), findsOneWidget);

      // Define the key need to check weather selection was successful
      const changeAllColorsSwitchKey = const Key('changeAllCardColors');
      const switchWidgetKey = const Key('switchWidget');

      await tester.tap(find.descendant(
          of: find.byKey(changeAllColorsSwitchKey),
          matching: find.byKey(switchWidgetKey)));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      final MainSetStateState state = tester.state(find.byType(MainSetState));

      expect(state.allCardsBackgroundColorSwitch, true);
    });
  });

  group('BLoC', () {
    testWidgets('Choose BLoC in the index', (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Define the keys needed for the selection test
      const blocMainKey = const Key('blocSelection');
      const blocChildKey = const Key('libSelectionItem');

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(blocChildKey), matching: find.byKey(blocMainKey)));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Define the key need to check weather selection was successful
      const blocPageKey = const Key('blocPage');

      // Expecter
      expect(find.byKey(blocPageKey), findsOneWidget);
    });
  });

  group('Provider', () {
    testWidgets('Choose Provider in the index', (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Define the keys needed for the selection test
      const providerMainKey = const Key('providerSelection');
      const providerChildKey = const Key('libSelectionItem');

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(providerChildKey),
          matching: find.byKey(providerMainKey)));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Define the key need to check weather selection was successful
      const providerPageKey = const Key('providerPage');

      // Expecter
      expect(find.byKey(providerPageKey), findsOneWidget);
    });
  });
}
