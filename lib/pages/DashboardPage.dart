import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:toast/toast.dart';
import 'package:user_reg_app/helper/Constants.dart';
import 'package:user_reg_app/pages/AddTaskPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  GlobalKey<FormState> formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            /*DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),*/

            UserAccountsDrawerHeader(
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add Task'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // _settingModalBottomSheet(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTaskPage()));
        },
        child: Icon(Icons.add),
        elevation: 16,
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    var taskTitle = "", description="";
    var _date = "DD-MM-YYYY";
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

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {

          return Container(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      ('ADD TASK'),
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: eighteen_dimen),
                    ),
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

                          _date = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {
                            print('DATE___$_date');
                            _date = '${date.year} - ${date.month} - ${date.day}';
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
                    RaisedButton(onPressed: (){

                    },
                      child: Text('Save'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
