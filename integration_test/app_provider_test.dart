import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:tcc_performance_app/main.dart' as app;
import 'package:tcc_performance_app/src/features/provider/card_provider.dart';
import 'package:tcc_performance_app/src/features/provider/description_provider.dart';
import 'package:tcc_performance_app/src/features/provider/screen_provider.dart';
import 'package:tcc_performance_app/src/features/provider/title_provider.dart';
import 'package:tcc_performance_app/src/utils/constants/keys_constant.dart';

void main() {
  // Ensure that the emulator is initialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Provider', () {
    testWidgets('Choose Provider in the index', (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the bloc option by tapping the the libSelectionItem Key from the parent providerSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getProviderSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the provider page
      expect(find.byKey(KeysConstant.getProviderPageKey()), findsOneWidget);
    });

    testWidgets('Change all card colors in Provider page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the provider option by tapping the the libSelectionItem Key from the parent providerSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getProviderSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the provider page
      expect(find.byKey(KeysConstant.getProviderPageKey()), findsOneWidget);

      // Tap over the switch to change all card colors
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllCardColorsKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final ScreenProviderState state = tester.state(find.byType(ScreenProvider));

      // Get the provider instance to access it's properties
      final providerState = state.context.read<CardProvider>();

      // Expect the switch of all card background color value to be true
      expect(providerState.getSwitchAllColors(), true);
    });

    testWidgets('Change all title colors in Provider page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the provider option by tapping the the libSelectionItem Key from the parent providerSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getProviderSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the provider page
      expect(find.byKey(KeysConstant.getProviderPageKey()), findsOneWidget);

      // Tap over the switch to change all title colors
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllTitleColorsKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final ScreenProviderState state = tester.state(find.byType(ScreenProvider));

      // Get the provider instance to access it's properties
      final providerState = state.context.read<TitleProvider>();

      // Expect the switch of all title colors value to be true
      expect(providerState.getSwitchAllColors(), true);
    });

    testWidgets('Change all title font size in Provider page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the provider option by tapping the the libSelectionItem Key from the parent providerSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getProviderSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the provider page
      expect(find.byKey(KeysConstant.getProviderPageKey()), findsOneWidget);

      // Tap over the switch to change all title font sizes
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllTitleFontSizesKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final ScreenProviderState state = tester.state(find.byType(ScreenProvider));

      // Get the provider instance to access it's properties
      final providerState = state.context.read<TitleProvider>();

      // Expect the switch of all title font sizes value to be true
      expect(providerState.getSwitchAllFontSizes(), true);
    });

    testWidgets('Change all description colors in Provider page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the provider option by tapping the the libSelectionItem Key from the parent providerSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getProviderSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the provider page
      expect(find.byKey(KeysConstant.getProviderPageKey()), findsOneWidget);

      // Tap over the switch to change all description colors
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllDescriptionColorsKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final ScreenProviderState state = tester.state(find.byType(ScreenProvider));

      // Get the provider instance to access it's properties
      final providerState = state.context.read<DescriptionProvider>();

      // Expect the switch of all description colors value to be true
      expect(providerState.getSwitchAllColors(), true);
    });

    testWidgets('Change all description font sizes in BLoC page',
        (WidgetTester tester) async {
      // Initiate an instance of the App
      app.main();

      // Wait for the content to be loaded
      await tester.pumpAndSettle();

      // Choose the provider option by tapping the the libSelectionItem Key from the parent providerSelection Key
      await tester.tap(find.ancestor(
          of: find.byKey(KeysConstant.getLibSelectionItemKey()),
          matching: find.byKey(KeysConstant.getProviderSelectionKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Expect to be in the provider page
      expect(find.byKey(KeysConstant.getProviderPageKey()), findsOneWidget);

      // Tap over the switch to change all description font sizes
      await tester.tap(find.descendant(
          of: find.byKey(KeysConstant.getSwitchAllDescriptionFontSizesKey()),
          matching: find.byKey(KeysConstant.getSwitchWidgetKey())));

      // Wait once again for the content to be loaded
      await tester.pumpAndSettle();

      // Get the state instance to access the page variables
      final ScreenProviderState state = tester.state(find.byType(ScreenProvider));

      // Get the provider instance to access it's properties
      final providerState = state.context.read<DescriptionProvider>();

      // Expect the switch of all description font sizes value to be true
      expect(providerState.getSwitchAllFontSizes(), true);
    });
  });
}
