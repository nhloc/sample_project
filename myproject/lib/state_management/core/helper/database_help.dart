import 'package:myproject/state_management/domain/entities/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "myDatabase.db";
  static const _databaseVersion = 1;
  static const table_user = 'ms_users';
  static const table_todo = 'ms_todos';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + _databaseName;
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table_user (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            fullname TEXT NOT NULL,
            username TEXT NOT NULL,
            password TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $table_todo (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT NOT NULL,
            description TEXT NOT NULL
          )
          ''');
  }

  Future<int> insertTable(String tablename, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tablename, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsTable(String tablename) async {
    Database db = await instance.database;
    return await db.query(tablename);
  }

  Future<int> deleteTable(String tablename, int id) async {
    Database db = await instance.database;
    return await db.delete(tablename, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> selectUsername(
      String tablename, String username) async {
    Database db = await instance.database;
    return await db
        .query(tablename, where: 'username = ?', whereArgs: [username]);
  }

  Future<List<Map<String, dynamic>>> login(
      String tablename, LoginRequest login) async {
    Database db = await instance.database;
    return await db.rawQuery(
        '''SELECT * FROM $table_user WHERE username = '${login.username}' AND password = '${login.password}' ''');
  }
}
