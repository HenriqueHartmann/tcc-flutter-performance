import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tcc_performance_app/main.dart' as app;
import 'package:tcc_performance_app/src/features/setState/main_setState.dart';
import 'package:tcc_performance_app/src/utils/constants/keys_constant.dart';

void main() {
  // Ensure that the emulator is initialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('setState', () {
    testWidgets('Choose SetState in the index', (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getSetStateSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the set state page
      expect(find.byKey(KeysConstant.getSetStatePageKey()), findsOneWidget);
    });

    testWidgets('Change all card colors in SetState page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getSetStateSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the set state page
      expect(find.byKey(KeysConstant.getSetStatePageKey()), findsOneWidget);

      // Tap over the switch to change all card colors
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllCardColorsKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final MainSetStateState state = tester.state(find.byType(MainSetState));

      // Expect the switch of all card background color value to be true
      expect(state.allCardsBackgroundColorSwitch, true);
    });

    testWidgets('Change all title colors in SetState page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getSetStateSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the set state page
      expect(find.byKey(KeysConstant.getSetStatePageKey()), findsOneWidget);

      // Tap over the switch to change all title colors
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllTitleColorsKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final MainSetStateState state = tester.state(find.byType(MainSetState));

      // Expect the switch of all title colors value to be true
      expect(state.allTitleFontColorSwitch, true);
    });

    testWidgets('Change all title font size in SetState page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getSetStateSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the set state page
      expect(find.byKey(KeysConstant.getSetStatePageKey()), findsOneWidget);

      // Tap over the switch to change all title font sizes
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllTitleFontSizesKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final MainSetStateState state = tester.state(find.byType(MainSetState));

      // Expect the switch of all title font sizes value to be true
      expect(state.allTitleFontSizeSwitch, true);
    });

    testWidgets('Change all description colors in SetState page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getSetStateSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the set state page
      expect(find.byKey(KeysConstant.getSetStatePageKey()), findsOneWidget);

      // Tap over the switch to change all description colors
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllDescriptionColorsKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final MainSetStateState state = tester.state(find.byType(MainSetState));

      // Expect the switch of all description colors value to be true
      expect(state.allDescriptionFontColorSwitch, true);
    });

    testWidgets('Change all description font sizes in SetState page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the setState option by tapping the the libSelectionItem Key from the parent setStateSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getSetStateSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the set state page
      expect(find.byKey(KeysConstant.getSetStatePageKey()), findsOneWidget);

      // Tap over the switch to change all description font sizes
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllDescriptionFontSizesKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final MainSetStateState state = tester.state(find.byType(MainSetState));

      // Expect the switch of all description font sizes value to be true
      expect(state.allDescriptionFontSizeSwitch, true);
    });
  });
}
