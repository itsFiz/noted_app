import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static final _databaseVersion = 1;

  // User table
  static const tableUser = 'user';
  static const columnUserName = 'username';
  static const columnPassword = 'password';

  // Subject table
  static const tableSubject = 'subject';
  // user name
  static const columnSubjectName = 'subject';

  // Noted table
  static const tableNoted = 'noted';
  // user name
  // subject name
  static const columnNotedName = 'noted';
  static const columnNotedDue = 'due';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notedapp.db');

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableUser (
            $columnUserName TEXT PRIMARY KEY,
            $columnPassword TEXT NOT NULL
          )
          ''');
    await db.execute('''CREATE TABLE $tableSubject (
            $columnUserName TEXT NOT NULL,
            $columnSubjectName TEXT NOT NULL,
            PRIMARY KEY ($columnUserName, $columnSubjectName)
          )
          ''');
    await db.execute('''CREATE TABLE $tableNoted (
            $columnUserName TEXT NOT NULL,
            $columnSubjectName TEXT NOT NULL,
            $columnNotedName TEXT NOT NULL,
            $columnNotedDue TEXT NOT NULL,
            PRIMARY KEY ($columnUserName, $columnSubjectName, $columnNotedName)
          )
          ''');
  }

  // Future<int?> queryRowCount() async {
  //   Database? db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  // }
}
