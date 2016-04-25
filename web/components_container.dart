import "package:react/react.dart";
import 'package:x_editable_react_dart/components/simple_text_field.dart';

var simpleTextField = registerComponent(() => new SimpleTextField());

class ComponentsContainer extends Component {

  @override
  render() {
    return
      div({},
          table({"id": "user", "className": "table table-bordered table-striped", "style": {"clear": "both"}},
              tbody({},
                  tr({},
                      td({"width": "35%"}, "Simple text field" ),
                      td({"width": "65%"}, simpleTextField({}) )
                  ),
                  tr({},
                      td({}, "Empty text field, required"),
                      td({},
                          a({"href": "#", "id": "firstname", "data-type": "text", "data-pk": "1", "data-placement": "right", "data-placeholder": "Required", "data-title": "Enter your firstname", "className": "editable editable-click editable-empty"},
                              "Empty"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Select, local array, custom display"),
                      td({},
                          a({"href": "#", "id": "sex", "data-type": "select", "data-pk": "1", "data-value": "", "data-title": "Select sex", "className": "editable editable-click", "style": {"color": "gray"}},
                              "not selected"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Select, remote array, no buttons"),
                      td({},
                          a({"href": "#", "id": "group", "data-type": "select", "data-pk": "1", "data-value": "5", "data-source": "/groups", "data-title": "Select group", "className": "editable editable-click"},
                              "Admin"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Select, error while loading" ),
                      td({},
                          a({"href": "#", "id": "status", "data-type": "select", "data-pk": "1", "data-value": "0", "data-source": "/status", "data-title": "Select status", "className": "editable editable-click"},
                              "Active"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Datepicker"),
                      td({},
                          span({"className": "notready"},
                              "not implemented for Bootstrap 3 yet"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Combodate (date)"),
                      td({},
                          a({"href": "#", "id": "dob", "data-type": "combodate", "data-value": "1984-05-15", "data-format": "YYYY-MM-DD", "data-viewformat": "DD/MM/YYYY", "data-template": "D / MMM / YYYY", "data-pk": "1", "data-title": "Select Date of birth", "className": "editable editable-click"},
                              "15/05/1984"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Combodate (datetime)"),
                      td({},
                          a({"href": "#", "id": "event", "data-type": "combodate", "data-template": "D MMM YYYY  HH:mm", "data-format": "YYYY-MM-DD HH:mm", "data-viewformat": "MMM D, YYYY, HH:mm", "data-pk": "1", "data-title": "Setup event date and time", "className": "editable editable-click editable-empty"},
                              "Empty"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Textarea, buttons below. Submit by",
                          i({}, "ctrl+enter" )
                      ),
                      td({},
                          a({"href": "#", "id": "comments", "data-type": "textarea", "data-pk": "1", "data-placeholder": "Your comments here...", "data-title": "Enter comments", "className": "editable editable-pre-wrapped editable-click"},
                              "awesome", "user!"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Twitter typeahead.js" ),
                      td({},
                          a({"href": "#", "id": "state2", "data-type": "typeaheadjs", "data-pk": "1", "data-placement": "right", "data-title": "Start typing State..", "className": "editable editable-click"},
                              "California"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Checklist"),
                      td({},
                          a({"href": "#", "id": "fruits", "data-type": "checklist", "data-value": "2,3", "data-title": "Select fruits", "className": "editable editable-click"},
                              "peach",
                              br({}),
                              "apple"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Select2 (tags mode)" ),
                      td({},
                          a({"href": "#", "id": "tags", "data-type": "select2", "data-pk": "1", "data-title": "Enter tags", "className": "editable editable-click"},
                              "html, javascript"
                          )
                      )
                  ),
                  tr({},
                      td({}, "Select2 (dropdown mode)"),
                      td({},
                          a({"href": "#", "id": "country", "data-type": "select2", "data-pk": "1", "data-value": "BS", "data-title": "Select country", "className": "editable editable-click"},
                              "Bahamas"
                          )
                      )
                  ),
                  tr({},
                      td({},"Custom input, several fields"),
                      td({},
                          a({"href": "#", "id": "address", "data-type": "address", "data-pk": "1", "data-title": "Please, fill address", "className": "editable editable-click"},
                              b({},"Moscow"), ", Lenina st., bld. 12"
                          )
                      )
                  )
              )
          )
      );
  }
}