import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoe/models/Task.dart';

import 'TaskTile2.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  /*New Strings*/

  final String tableName = "tasksTable";
  final String columnTask = "title";
  final String columnId = "id";
  final String columnCategory = "category";

//  final String tableUser = "userTable";
////  final String columnId = "id";
//  final String columnUsername = "username";
//  final String columnPassword = "password";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,
        "maindb45.db"); //home://directory/files/maindb.db

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  /*
     id | username | password
     ------------------------
     1  | Paulo    | paulo
     2  | James    | bond
   */

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnTask TEXT, $columnCategory TEXT)");
  }

  //CRUD - CREATE, READ, UPDATE , DELETE

  //Insertion
  Future<int> saveTask(TaskTile2 task) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", task.toMap());
    return res;
  }

  //Get Users
  Future<List> getAllTasks() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName");

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<List> getTaskCategory(String category) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableName WHERE $columnCategory = '$category'");
    if (result.length == 0) return null;
    return result.toList();
  }

  Future<int> deleteTask(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableName, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateTask(Task task) async {
    var dbClient = await db;
    return await dbClient.update(tableName, task.toMap(),
        where: "$columnId = ?", whereArgs: [task.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
