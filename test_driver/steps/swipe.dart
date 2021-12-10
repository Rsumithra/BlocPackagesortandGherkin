import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class Swipetab extends AndWithWorld<FlutterWorld> {
  Swipetab()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    final list = find.byValueKey('contactListView');
    await world.driver?.scroll(list, 0, -2200, const Duration(seconds: 2));
  }

  @override
  RegExp get pattern => RegExp(r"I scroll the tab");
}
