import "package:react/react.dart";
import "package:react/react_dom.dart" as dom;
import "package:react/react_client.dart" as reactClient;
import 'components_container.dart';
import 'dart:html';
import 'package:js/js.dart' as js;


main() {
  reactClient.setClientConfiguration();
  var componentsContainer = registerComponent(() => new ComponentsContainer());
  var selector = querySelector("#components-container");
  dom.render(componentsContainer({}), selector);
}
