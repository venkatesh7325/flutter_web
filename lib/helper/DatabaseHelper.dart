import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:user_reg_app/models/AddTaskModel.dart';
class DatabaseHelper{

  final String tableTask = 'addtask';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnDescription = 'description';
  final String columnDate = 'date';
  var database;
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

     database= await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return database;
  }
  void _onCreate(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $tableTask ("
        "$columnId INTEGER PRIMARY KEY,"
        "$columnTitle TEXT,"
        "$columnDescription TEXT,"
        "$columnDate TEXT"
        ")");
   /* await db.execute("CREATE TABLE Customer ("
        "id INTEGER PRIMARY KEY,"
        "first_name TEXT,"
        "last_name TEXT,"
        "email TEXT"
        ")");*/
  }

  Future<int> saveTask(AddTaskModel addTaskModel) async{
    var dbClient = await database;
    var result = await dbClient.insert(tableTask, addTaskModel.toMap());
    return result;
  }


}
