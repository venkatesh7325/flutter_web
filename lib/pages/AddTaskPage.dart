import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_reg_app/helper/Constants.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:user_reg_app/helper/DatabaseHelper.dart';
import 'package:user_reg_app/models/AddTaskModel.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskStatePage();
  }
}

class _AddTaskStatePage extends State<AddTaskPage> {
  GlobalKey<FormState> formKey = new GlobalKey();
  var taskTitle, description;
  var _date = new DateFormat("dd-MM-yyyy").format(new DateTime.now());

  @override
  Widget build(BuildContext context) {
    final formTitle = TextFormField(
      decoration: InputDecoration(
          hintText: "Title",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15)),
      keyboardType: TextInputType.text,
      maxLines: 1,
      validator: (String value) {
        if (value.isEmpty) {
          return "Field can't be empty";
        }
      },
      onSaved: (value) => taskTitle = value,
    );
    final formDesc = TextFormField(
      decoration: InputDecoration(
          hintText: "Description",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15)),
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty) {
          return "Field can't be empty";
        }
      },
      onSaved: (value) => description = value,
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  formTitle,
                  SizedBox(height: ten_dimen),
                  formDesc,
                  SizedBox(
                    height: ten_dimen,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 4.0,
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('confirm $date');

                        _date = '${date.day} - ${date.month} - ${date.year}';
                        setState(() {
                          print('DATE___$_date');
                          _date = '${date.day} - ${date.month} - ${date.year}';
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      " $_date",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Change",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(height: ten_dimen),
                  RaisedButton(
                    onPressed: () {
                      bool flag = formKey.currentState.validate();
                      if (flag) {
                        saveOfflineData();
                      }
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveOfflineData() async {
    var db = new DatabaseHelper();
    var result = await db.saveTask(new AddTaskModel(taskTitle, description, _date));
    print("Saved to DB $result");
    if (result > 0) {
      Navigator.pop(context);
    }
  }
}
