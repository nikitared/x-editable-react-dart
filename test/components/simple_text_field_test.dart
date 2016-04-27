import "package:react/react.dart";
import "package:react/react_dom.dart" as dom;
import "package:react/react_client.dart" as client;
import "package:react/react_test_utils.dart" as reactTestUtils;

import "package:test/test.dart";
import 'package:x_editable_react_dart/components/simple_text_field.dart';

var simpleTextField = registerComponent(() => new SimpleTextField());

main() {
  client.setClientConfiguration();

  test("browse Simple Text Field component", () {
    var component = reactTestUtils.renderIntoDocument(simpleTextField({}));
    reactTestUtils.Simulate.change(component, {"target": {"value" : "dsfsdf"}});

  });
}