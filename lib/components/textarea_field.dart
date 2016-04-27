import "package:react/react.dart";
import "package:react/react_dom.dart" as dom;
import 'package:x_editable_react_dart/components/x_editable.dart';
import 'dart:html';

class TextareaField extends Component implements XEditable {

  Map getInitialState() => {
    "editable": false,
    "value": "",
    "tmp": ""
  };

  toEdit(event) {
    setState({"editable": true, "tmp": state["value"]});
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
      span({"className": "editable-container editable-inline", "style": {}},
          div({},
              div({"className": "editableform-loading", "style": {"display": "none"}}),
              form({"className": "form-inline editableform", "style": {}},
                  div({"className": "control-group form-group"},
                      div({},
                          div({"className": "editable-input"},
                              textarea({"value": bind("tmp"), "className": "form-control input-large", "placeholder": "Your comments here...", "rows": "7"})
                          ),
                          div({"className": "editable-buttons editable-buttons-bottom"},
                              button({"onClick": apply, "type": "submit", "className": "btn btn-primary btn-sm editable-submit"},
                                  i({"className": "fa fa-check"})
                              ),
                              button({"onClick": cancel, "type": "button", "className": "btn btn-default btn-sm editable-cancel"},
                                  i({"className": "fa fa-remove"})
                              )
                          )
                      ),
                      div({"className": "editable-error-block help-block", "style": {"display": "none"}})
                  )
              )
          )
      );
  }

  @override
  view() {

    bool isEmpty = (state["value"] == "");
    String classes = "editable editable-click " + (isEmpty ? "editable-empty" : "");

    return a({"href": "#", "onClick": toEdit, "id": "username",
      "data-type": "text",
      "data-pk": "1",
      "data-title": "Enter username",
      "className": classes,
      "style": {"display": "inline"}},
        (isEmpty) ? "Empty" : state["value"]
    );
  }
}