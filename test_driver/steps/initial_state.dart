import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class InitialStateOfApp extends GivenWithWorld<FlutterWorld> {
  InitialStateOfApp()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await world.driver?.waitFor(find.text('name 1'));
  }

  @override
  RegExp get pattern => RegExp(r"I test the initial state of the app");
}
