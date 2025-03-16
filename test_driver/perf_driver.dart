import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeline = driver.Timeline.fromJson(
          data['set_state_change_all_card_colors'] as Map<String, dynamic>,
        );

        final summary = driver.TimelineSummary.summarize(timeline);

        await summary.writeTimelineToFile(
          'set_state_change_all_card_colors',
          destinationDirectory: 'C:/Users/alema/Documents/Workspace/tcc',
          pretty: true,
          includeSummary: true,
        );
      }
    },
  );
}
