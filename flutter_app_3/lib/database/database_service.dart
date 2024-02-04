import 'package:flutter_app_3/database/todo_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    print("Database path: ${await getDatabasesPath()}");
    if(_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'todo.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }


  Future<Database> _initialize() async {
    final path = await fullPath;
    print("Database path: ${await getDatabasesPath()}");
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async {
    await TodoDB().createTable(database);
  }

}


