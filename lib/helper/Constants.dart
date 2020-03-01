import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appName = "User Registration";

Color white = Colors.white;
Color appDarkGreyColor = Color.fromRGBO(58, 66, 86, 1.0);

const ten_dimen = 10.0;
const twenty_dimen = 20.0;
const sixteen_dimen = 16.0;
const eighteen_dimen = 18.0;
const twenty_five_dimen = 25.0;
const twely_dimen = 12.0;
const fourteen_dimen = 14.0;

const fifty_dimen = 50.0;
const hundred_dimen = 100.0;


Future<String> getStringValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(key);
  return stringValue;
}

addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}


saveBooleenToSF(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<bool> getBoolValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool stringValue = prefs.getBool(key);
  return stringValue;
}

