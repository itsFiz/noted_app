import 'package:flutter/cupertino.dart';
import 'package:flutter_project/models/noted.dart';
import 'package:flutter_project/services/dbhelper.dart';
import 'package:sqflite/sqflite.dart';

class UserDAO extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  static const tableUser = 'user';
  static const tableSubject = 'subject';
  static const tableNoted = 'noted';

  Future<int> register(String username, String password) async {
    Database? db = await databaseHelper.database;
    int res = await db!.insert(tableUser, {
      'username': username,
      'password': password,
    });
    return res;
  }

  Future<dynamic> login(String username, String password) async {
    Database? db = await databaseHelper.database;
    List<Map> res = await db!.query(tableUser,
        columns: ['username', 'password'],
        where: 'username = ? and password = ?',
        whereArgs: [username, password]);
    if (res.length != 0) {
      return res.first['username'];
    }
    return null;
  }

  insertSubject(String username, String subjectName) async {
    Database? db = await databaseHelper.database;
    int res = await db!
        .insert(tableSubject, {'username': username, 'subject': subjectName});
  }

  deleteSubject(String username, String subjectName) async {
    Database? db = await databaseHelper.database;
    await db!.delete(tableNoted,
        where: 'username = ? and subject = ?',
        whereArgs: [username, subjectName]);

    await db.delete(tableSubject,
        where: 'username = ? and subject = ?',
        whereArgs: [username, subjectName]);
  }

  Future<List<Map>> getSubjects(String username) async {
    Database? db = await databaseHelper.database;
    List<Map> res = await db!.query(tableSubject,
        columns: ['subject'], where: 'username = ?', whereArgs: [username]);
    return res;
  }

  insertNoteds(String username, String subjectName, Noted noted) async {
    Database? db = await databaseHelper.database;
    await db!.insert(tableNoted, {
      'username': username,
      'subject': subjectName,
      'noted': noted.name,
      'due': noted.due
    });
  }

  deleteNoted(String username, String subjectName, String notedName) async {
    Database? db = await databaseHelper.database;
    await db!.delete(tableNoted,
        where: 'username = ? and subject = ? and noted = ?',
        whereArgs: [username, subjectName, notedName]);
  }

  Future<List<Noted>> getNoteds(String username, String subject) async {
    Database? db = await databaseHelper.database;
    List<Map> res = await db!.query(tableNoted,
        columns: ['noted', 'due'],
        where: 'username = ? and subject = ?',
        whereArgs: [username, subject]);

    List<Noted> noteds = res.map((r) {
      return Noted(
        r['noted'],
        r['due'],
      );
    }).toList();
    return noteds;
  }
}
