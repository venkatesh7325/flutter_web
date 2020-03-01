import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:user_reg_app/helper/Constants.dart';
import 'package:user_reg_app/pages/DashboardPage.dart';

import 'package:user_reg_app/pages/RegistrationPage.dart';



class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var mobileNumber = "";
  var prefMobile = "";
  var loginStatus=false;

  @override
  void initState() {
    print("INIT");
    super.initState();

    getBoolValuesSF("status").then((value) {
      print("From Pref status value $value");
      loginStatus = value;

      if(loginStatus){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>DashboardPage()));
      }
    });



  }

  @override
  Widget build(BuildContext context) {
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
    // TODO: implement build

    final btnSave = SizedBox(
        // width: double.infinity,
        child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(twely_dimen)),
      child: Text("Login"),
      padding: EdgeInsets.all(fourteen_dimen),
      onPressed: () {
        bool flag = _formKey.currentState.validate();
        if (flag) {
          _formKey.currentState.save();

          print("Entered mobile Number $mobileNumber");


          getStringValuesSF("Mobile").then((value) {
            print("From Pref value $value");
            prefMobile = value;
          });

          bool flag = (prefMobile == mobileNumber);
          print(flag);
          if (flag) {
            saveBooleenToSF("status", true);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
          } else {
          Toast.show('User not exist', context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
        }
        }
      },
    ));

    /*final formRegister = GestureDetector(
        onTap: () {
          print("Clicked on Reg");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationPage()));
        },
        child: new Padding(
            padding: new EdgeInsets.all(ten_dimen),
            child: new Text('Register?',
                style: TextStyle(color: Colors.blue, fontSize: twely_dimen),
                textAlign: TextAlign.right)));*/

    final btnReg = RaisedButton(
      child: Text('Register'),
      onPressed: (){
        Toast.show('Clicked on new Register', context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationPage()));
      },
    );

    return new Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Container(
        child: new Padding(
          padding: EdgeInsets.all(ten_dimen),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                formMobile,
                SizedBox(
                  height: fourteen_dimen,
                ),
                btnSave,
                SizedBox(
                  height: fourteen_dimen,
                ),
                btnReg
              ],
            ),
          ),
        ),
      ),
    );
  }
}
