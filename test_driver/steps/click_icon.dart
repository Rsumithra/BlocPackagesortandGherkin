import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class ClickIcone extends And1WithWorld<String, FlutterWorld> {
  ClickIcone()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep(String value) async {
    await world.driver?.tap(find.byValueKey(value));
  }

  @override
  RegExp get pattern => RegExp(r"I click the {string} icon");
}
