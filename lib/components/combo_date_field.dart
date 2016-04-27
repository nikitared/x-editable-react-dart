import "package:react/react.dart";
import "package:react/react_dom.dart" as dom;
import 'package:x_editable_react_dart/components/x_editable.dart';
import 'package:intl/intl.dart';
import 'dart:html';
import 'dart:js';

class ComboDateField extends Component implements XEditable {

  final DateFormat dateFormat = new DateFormat('dd/MM/y');

  Map getInitialState() {

      var dateTime = new DateTime.now();

      return {
      "editable": false,
      "value": {
        "day": dateTime.day,
        "month": dateTime.month,
        "year": dateTime.year
      },
      "tmp_day": "",
      "tmp_month": "",
      "tmp_year": ""
    };
  }

  toEdit(event) {
    var val = state["value"];

    setState({
      "editable": true,
      "tmp_day": val["day"].toString(),
      "tmp_month": val["month"].toString(),
      "tmp_year": val["year"].toString()
    });
  }

  apply(event) {
    setState({
      "editable": false,
      "value": {
        "day": int.parse(state["tmp_day"]),
        "month": int.parse(state["tmp_month"]),
        "year": int.parse(state["tmp_year"])
      }
    });
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
                              input({"type": "text", "style": {"display": "none"}}),
                              span({"className": "combodate"},
                                  select({"value": bind("tmp_day"), "className": "day form-control", "style": {"width": "auto"}},
                                      getDays()
                                  ),
                                  " / ",
                                  select({"value": bind("tmp_month"), "className": "month form-control", "style": {"width": "auto"}},
                                      getMonths()
                                  ),
                                  " / ",
                                  select({"value":  bind("tmp_year"), "className": "year form-control", "style": {"width": "auto"}},
                                      getYears()
                                  )
                              )
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
                      div({"className": "editable-error-block help-block", "style": {"display": "none"}})
                  )
              )
          )
      );
  }

  @override
  view() {
    bool isEmpty = (state["value"].toString() == "");
    String classes = "editable editable-click " + (isEmpty ? "editable-empty" : "");

    print(state["value"]);

    var val = state["value"];

    var dateTime = new DateTime(
        val["year"],
        val["month"],
        val["day"]
    );

    var dateString = dateFormat.format(dateTime);

    return a({"href": "#", "onClick": toEdit, "id": "username",
      "data-type": "text",
      "data-pk": "1",
      "data-title": "Enter username",
      "className": classes,
      "style": {"display": "inline"}},
        (isEmpty) ? "Empty" : dateString
    );
  }

  JsArray getDays() {
    JsArray result = new JsArray();
    for(var i = 1; i <= 31; i++) {
      result.add(option({"value": i.toString()}, i.toString() ));
    }
    return result;
  }

  JsArray getMonths() {
    JsArray result = new JsArray();
    for(var i = 1; i <= 12; i++) {
      result.add(option({"value": i.toString()}, i.toString() ));
    }
    return result;
  }

  JsArray getYears() {
    JsArray result = new JsArray();
    for(var i = 1970; i <= 2020; i++) {
      result.add(option({"value": i.toString()}, i.toString() ));
    }
    return result;
  }
}

