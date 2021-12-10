import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/check_text.dart';
import 'steps/initial_state.dart';
import 'steps/click_icon.dart';
import 'steps/swipe.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/feature/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..stepDefinitions = [
      InitialStateOfApp(),
      ClickIcone(),
      Swipetab(),
      CheckText(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  // // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}
