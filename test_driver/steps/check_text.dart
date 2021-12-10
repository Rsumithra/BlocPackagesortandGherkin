import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class CheckText extends Then1WithWorld<String, FlutterWorld> {
  CheckText()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep(String value) async {
    await world.driver?.waitFor(find.text(value));
  }

  @override
  RegExp get pattern => RegExp(r"I see if the text {string} exists");
}
