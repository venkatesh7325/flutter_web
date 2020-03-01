
import 'package:flutter/material.dart';

import 'package:toast/toast.dart';

import 'package:user_reg_app/helper/Constants.dart';
import 'package:user_reg_app/pages/LoginPage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _userNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var name, email, mobileNumber, address;
  int _radioValue1 = -1;
  String selectedItem = "";

  @override
  void initState() {
    print("INIT");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formName = TextFormField(
      // controller: _userNameController,
      decoration: InputDecoration(
          hintText: "Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15)),
      keyboardType: TextInputType.text,
      maxLines: 1,
      validator: (String value) {
        if (value.isEmpty) {
          return "Field can't be empty";
        }
      },
      onSaved: (value) => name = value,
    );

    final formEmail = TextFormField(
      decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15)),
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      validator: (String value) {
        if (value.isEmpty) {
          return "Field can't be empty";
        }
      },
      onSaved: (value) => email = value,
    );

    final formMobile = TextFormField(
      decoration: InputDecoration(
          hintText: "Mobile",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15)),
      keyboardType: TextInputType.phone,
      maxLines: 1,
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return "Field can't be empty";
        }
        if (value.length != 10) {
          return "Enter valid mobile number";
        }
      },
      onSaved: (value) => mobileNumber = value,
    );

    final formAddress = TextFormField(
      decoration: InputDecoration(
          hintText: "Address",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15)),
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty) {
          return "Field can't be empty";
        }
      },
      onSaved: (value) => address = value,
    );

    final btnRegister = SizedBox(
        width: double.infinity,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(twely_dimen)),
          child: Text("Save"),
          padding: EdgeInsets.all(fourteen_dimen),
          onPressed: () {
            print("Clicked on Register");
            bool flag = _formKey.currentState.validate();
            print("Reg flag --> $flag");
            if (flag) {
              _formKey.currentState.save();
              addStringToSF("Name", name);
              addStringToSF("Mobile", mobileNumber);
              addStringToSF("Address", address);
              addStringToSF("Email", email);
              addStringToSF("Gender", selectedItem);
              Toast.show('Register Success', context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        ));

    void _handleRadioValueChange1(int value) {
      setState(() {
        _radioValue1 = value;

        switch (_radioValue1) {
          case 0:
          //  Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
            Toast.show("Male", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
            selectedItem = "Male";
            break;
          case 1:
            Toast.show('Female', context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
            selectedItem = "Female";
            // Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
            break;
        }
      });
    }

    final formGender = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Radio(
            value: 0,
            groupValue: _radioValue1,
            onChanged: _handleRadioValueChange1),
        new Text(
          "Male",
          style: new TextStyle(fontSize: sixteen_dimen),
        ),
        new Radio(
            value: 1,
            groupValue: _radioValue1,
            onChanged: _handleRadioValueChange1),
        new Text(
          "Female",
          style: new TextStyle(fontSize: sixteen_dimen),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  formName,
                  SizedBox(height: ten_dimen),
                  formEmail,
                  SizedBox(height: ten_dimen),
                  formMobile,
                  SizedBox(height: ten_dimen),
                  formAddress,
                  SizedBox(height: ten_dimen),
                  formGender,
                  btnRegister
                ],
              ),
            )),
      ),
    );
  }
}
