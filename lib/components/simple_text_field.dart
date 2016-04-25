import "package:react/react.dart";
import "package:react/react_dom.dart" as dom;
import 'package:x_editable_react_dart/components/x_editable.dart';
import 'dart:html';

class SimpleTextField extends Component implements XEditable {

  Map getInitialState() => {
    "editable": false,
    "value": "",
    "tmp": ""
  };

  toEdit(event) {
    setState({"editable": true, "tmp": state["value"]});
  }

  clear(event) {
    setState({"tmp": ""});
  }

  apply(event) {
    setState({"editable": false, "value": state["tmp"]});
  }

  cancel(event) {
    setState({"editable": false});
  }

  @override
  render() {
    if (state["editable"]) return edit();
    else return view();
  }

  @override
  edit() {
    return
      span({"className": "editable-container editable-inline"},
          div({},
              div({
                "className": "editableform-loading",
                "style": {"display": "none"}
              }),
              form({"className": "form-inline editableform"},
                  div({"className": "control-group form-group"},
                      div({},
                          div({
                            "className": "editable-input",
                            "style": {"position": "relative"}
                          },
                              input({
                                "type": "text",
                                "value": bind("tmp"),
                                "className": "form-control input-sm",
                                "style": {"paddingRight": "24px"}
                              }),
                              span({
                                "className": "editable-clear-x",
                                "onClick": clear
                              })
                          ),
                          div({"className": "editable-buttons"},
                              button({
                                "type": "submit",
                                "onClick": apply,
                                "className": "btn btn-primary btn-sm editable-submit"
                              },
                                  i({"className": "fa fa-check"})
                              ),
                              button({
                                "type": "button",
                                "onClick": cancel,
                                "className": "btn btn-default btn-sm editable-cancel"
                              },
                                  i({"className": "fa fa-remove"})
                              )
                          )
                      ),
                      div({
                        "className": "editable-error-block help-block",
                        "style": {"display": "none"}
                      })
                  )
              )
          )
      );
  }

  @override
  view() {
    return a({"href": "#", "onClick": toEdit, "id": "username",
      "data-type": "text",
      "data-pk": "1",
      "data-title": "Enter username",
      "className": "editable editable-click",
      "style": {"display": "inline"}},
        (state["value"] == "") ? "Empty" : state["value"]
    );
  }
}