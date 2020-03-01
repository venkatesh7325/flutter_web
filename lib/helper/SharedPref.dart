import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future setString(String key, String value) async{
    final p = await prefs;
    return p.setString(key, value);
  }

  static Future<String> getString(String key) async{
    final p = await prefs;
    return p.getString(key) ?? '';
  }

}

/*
Future<String> getString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
Future<String> getSortingOrder(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString(key) ?? 'name';
}*/
